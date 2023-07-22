import 'package:equatable/equatable.dart';
import 'package:go_router/go_router.dart';
import 'package:know_your_game/features/main_page/main_page.dart';
import 'package:know_your_game/features/profile_page/view/profile_page.dart';
import 'package:know_your_game/features/questions_page/view/question_page.dart';
import 'package:know_your_game/features/questions_results_page/view/questions_results_page.dart';
import 'package:know_your_game/utils/widgets/pdf_viewer_page_widget.dart';

GoRouter mockRouter([String? initialLocation]) => GoRouter(
      initialLocation: initialLocation ?? Routes.main,
      routes: [
        GoRoute(
          path: Routes.main,
          builder: (_, __) => MainPage(),
        ),
        GoRoute(
          path: Routes.profile,
          builder: (_, __) => ProfilePage(),
        ),
        GoRoute(
          path: Routes.questionsResults,
          builder: (_, __) => QuestionsResultsPage(),
        ),
        GoRoute(
          path: Routes.questions,
          builder: (_, __) => QuestionPage(),
        ),
        GoRoute(
          path: Routes.pdfViewer,
          builder: (_, __) => PdfViewerPageWidget(
            pdfPath: "assets/laws_of_game.pdf",
          ),
        ),
      ],
    );

class Routes extends Equatable {
  static final String main = "/main";
  static final String profile = "/profile";
  static final String questionsResults = "/questions_results";
  static final String questions = "/questions";
  static final String pdfViewer = "/pdfViewer";

  @override
  List<Object?> get props => [main, profile, questionsResults, questions, pdfViewer];
}
