import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:know_your_game/features/main_page/widgets/rule_book_button.dart';
import 'package:know_your_game/features/questions_page/view/question_page.dart';
import 'package:know_your_game/utils/dummy/dummy_user.dart';
import 'package:know_your_game/utils/utils.dart';
import 'package:know_your_game/utils/widgets/kyg_container.dart';
import 'package:know_your_game/utils/widgets/kyg_list_tile.dart';

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
                        Expanded(
                          child: KygContainer(
                            height: MediaQuery.of(context).size.width * 0.75,
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                KygListTile(user: dummyUser),
                                KygListTile(user: dummyUser),
                                KygListTile(user: dummyUser),
                                KygListTile(user: dummyUser),
                                KygListTile(user: dummyUser),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    KygButton(
                      onTap: () {
                        ref.read(firstTimeQuestionScreenProvider.notifier).state = true;
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
