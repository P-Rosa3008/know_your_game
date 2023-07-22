import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:know_your_game/features/entry_page/view/entry_page.dart';
import 'package:know_your_game/features/main_page/main_page.dart';
import 'package:know_your_game/features/profile_page/view/profile_page.dart';
import 'package:know_your_game/features/questions_page/view/question_page.dart';
import 'package:know_your_game/features/questions_results_page/view/questions_results_page.dart';
import 'package:know_your_game/utils/animations/page_transition.dart';
import 'package:know_your_game/utils/routes/routes_endpoints.dart';
import 'package:know_your_game/utils/widgets/widgets.dart';

void main() => runApp(
      const ProviderScope(
        child: MyApp(),
      ),
    );

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final GoRouter _router = GoRouter(
      initialLocation: RoutesEndpoints.main,
      routes: <RouteBase>[
        ShellRoute(
          builder: (context, state, child) {
            return EntryPage(
              child: child,
            );
          },
          routes: [
            GoRoute(
              path: RoutesEndpoints.main,
              pageBuilder: (context, GoRouterState state) => KygPageTransition().build(MainPage()),
            ),
            GoRoute(
              path: RoutesEndpoints.profile,
              pageBuilder: (context, GoRouterState state) => KygPageTransition().build(ProfilePage()),
            )
          ],
        ),
        GoRoute(
          path: RoutesEndpoints.questionsResults,
          pageBuilder: (context, GoRouterState state) => KygPageTransition().build(QuestionsResultsPage()),
        ),
        GoRoute(
          path: RoutesEndpoints.questions,
          pageBuilder: (context, GoRouterState state) => KygPageTransition().build(QuestionPage()),
        ),
        GoRoute(
          path: RoutesEndpoints.pdfViewer,
          pageBuilder: ((context, GoRouterState state) => KygPageTransition().build(
                PdfViewerPageWidget(
                  pdfPath: "assets/laws_of_game.pdf",
                ),
              )),
        ),
      ],
    );

    return MaterialApp.router(
      scrollBehavior: CustomScroll(),
      title: 'KnowYourGame',
      routerConfig: _router,
    );
  }
}
