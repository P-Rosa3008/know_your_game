import 'package:flutter/material.dart' hide ErrorWidget;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:know_your_game/features/questions_page/view/widgets/answers.dart';
import 'package:know_your_game/features/questions_page/view/widgets/question.dart';
import 'package:know_your_game/features/questions_page/view_model/question_page_provider.dart';
import 'package:know_your_game/utils/utils.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:rive/rive.dart';

class QuestionPage extends ConsumerStatefulWidget {
  const QuestionPage({super.key});
  @override
  _QuestionPageState createState() => _QuestionPageState();
}

final isLockedProvider = StateProvider<bool>((ref) => false);

final showProgressBarAnimationProvider = StateProvider((ref) => false);

final firstTimeQuestionScreenProvider = StateProvider((ref) => true);

final questionNumberProvider = StateProvider<int>((ref) => 0);

class _QuestionPageState extends ConsumerState<QuestionPage> with SingleTickerProviderStateMixin {
  late PageController _controller;
  bool? showProgressBarAnimation;

  late RiveAnimationController _animationController;

  void _retrieveQuestionPage() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(questionPageProvider.notifier).retrieveQuestionPage();
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
    _retrieveQuestionPage();
    showProgressBarAnimation = false;
    _animationController = SimpleAnimation(
      'Animation 1',
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(questionPageProvider);
    final questionNumber = ref.watch(questionNumberProvider);
    final questionNumberLength = provider.asData?.value.questions.length ?? 0;
    final showProgressBarAnimation = ref.watch(showProgressBarAnimationProvider);
    final firstTimeScreen = ref.watch(firstTimeQuestionScreenProvider);
    final isAnswerTrue = ref.watch(isAnswerTrueProvider);

    return Scaffold(
      body: provider.when(
        data: (data) {
          return Padding(
            key: Key('question_page_widget'),
            padding: const EdgeInsets.only(
              top: 64.0,
              left: 16.0,
              right: 16.0,
              bottom: 32.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    children: [
                      IconButton(
                        constraints: BoxConstraints(),
                        padding: EdgeInsets.all(0),
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onPressed: () {
                          ref.invalidate(questionNumberProvider);
                          context.go(RoutesEndpoints.main);
                        },
                        icon: Icon(Icons.settings_rounded),
                      ),
                      Expanded(
                        child: LinearPercentIndicator(
                          animation: true,
                          animationDuration: 450,
                          onAnimationEnd: firstTimeScreen
                              ? null
                              : () => ref.read(showProgressBarAnimationProvider.notifier).state = true,
                          widgetIndicator: Container(
                            padding: EdgeInsets.only(bottom: 5),
                            margin: EdgeInsets.only(right: 20),
                            height: 30,
                            width: 30,
                            child: showProgressBarAnimation && isAnswerTrue
                                ? RiveAnimation.asset(
                                    'assets/correct_answer.riv',
                                    controllers: [_animationController],
                                  )
                                : Container(),
                          ),
                          animateFromLastPercent: true,
                          barRadius: Radius.circular(16),
                          lineHeight: 12.5,
                          progressColor: ColorsUiTheme.mainGreen,
                          percent: questionNumber / questionNumberLength,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(),
                ),
                SizedBox(
                  height: 400,
                  child: PageView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: data.questions.length,
                    controller: _controller,
                    itemBuilder: (context, index) {
                      final _question = data.questions[index];

                      return QuestionWidget(question: _question, data: data);
                    },
                  ),
                ),
                KygButton(
                  margin: EdgeInsets.only(top: 16.0),
                  width: double.infinity,
                  color: ref.watch(isLockedProvider) ? ColorsUiTheme.mainGreen : ColorsUiTheme.disabledButton,
                  borderColor: Colors.transparent,
                  boxShadow: ref.watch(isLockedProvider)
                      ? [
                          BoxShadow(
                            color: ColorsUiTheme.shadowGreen,
                            offset: const Offset(0.0, 3.0),
                          )
                        ]
                      : [],
                  child: Center(
                    child: Text(
                      questionNumber < data.questions.length ? 'NEXT QUESTION' : 'END',
                      style: GoogleFonts.nunito(
                        color: ref.watch(isLockedProvider) ? Colors.white : ColorsUiTheme.shadow,
                        fontWeight: FontWeight.w800,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  onTap: ref.watch(isLockedProvider)
                      ? () {
                          if (questionNumber < data.questions.length) {
                            _controller.nextPage(
                              duration: const Duration(milliseconds: 250),
                              curve: Curves.easeInExpo,
                            );
                            ref.read(isLockedProvider.notifier).state = false;
                            ref.read(showProgressBarAnimationProvider.notifier).state = false;
                            ref.read(isAnswerTrueProvider.notifier).state = false;
                          } else {
                            context.go(RoutesEndpoints.questionsResults);
                          }
                        }
                      : null,
                )
              ],
            ),
          );
        },
        error: (error, stack) {
          return ErrorWidget(
            key: Key('question_page_error_widget'),
            error: error,
          );
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator(
              key: Key('question_page_loading_widget'),
            ),
          );
        },
      ),
    );
  }
}
