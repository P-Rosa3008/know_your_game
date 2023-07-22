import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:know_your_game/features/main_page/widgets/rule_book_button.dart';
import 'package:know_your_game/features/questions_page/view/question_page.dart';
import 'package:know_your_game/utils/utils.dart';
import 'package:know_your_game/utils/widgets/kyg_container.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
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
                        Expanded(child: KygContainer(height: MediaQuery.of(context).size.width * 0.75),),
                      ],
                    ),
                    KygButton(
                      onTap: () {
                        ref.read(firstTimeQuestionScreenProvider.notifier).state = true;
                        context.go(RoutesEndpoints.questions);
                      },
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: Text(
                        "Começar",
                        style: textTheme.bodyLarge,
                        textAlign: TextAlign.center,
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
