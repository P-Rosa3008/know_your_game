import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:know_your_game/features/main_page/widgets/rule_book_button.dart';
import 'package:know_your_game/features/questions_page/view/question_page.dart';
import 'package:know_your_game/features/questions_page/view_model/question_page_provider.dart';

import '../../../utils/utils.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  void _retrieveQuestionPage() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(questionPageProvider.notifier).retrieveQuestionPage();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Key('main_page_scaffold_widget'),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RuleBookButton(),
                    Row(
                      children: [
                        KygLeaderboard(),
                      ],
                    ),
                    KygButton(
                      onTap: () {
                        ref.read(firstTimeQuestionScreenProvider.notifier).state = true;
                        _retrieveQuestionPage();
                        context.go(RoutesEndpoints.questions);
                      },
                      width: MediaQuery.of(context).size.width * 0.5,
                      color: ColorsUiTheme.mainGreen,
                      borderColor: Colors.transparent,
                      boxShadow: [
                        BoxShadow(
                          color: ColorsUiTheme.shadowGreen,
                          offset: const Offset(0.0, 3.0),
                        )
                      ],
                      child: Center(
                        child: Text(
                          'Começar',
                          style: GoogleFonts.nunito(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
