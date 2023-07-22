import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:know_your_game/utils/utils.dart';
import 'package:know_your_game/utils/widgets/app_bar.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewerPageWidget extends StatelessWidget {
  final String pdfPath;
  final String? title;
  final bool allowPrinting;
  const PdfViewerPageWidget({Key? key, required this.pdfPath, this.title, this.allowPrinting = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBar: AppBar(),
        leadingWidget: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded),
          onPressed: () {
            context.go(RoutesEndpoints.main);
          },
        ),
        title: Text(
          "Leis do Jogo",
          style: textTheme.headline3,
        ),
      ),
      body: SfPdfViewer.asset(
        "assets/laws_of_game.pdf",
        pageSpacing: 8,
        canShowPaginationDialog: false,
        canShowScrollHead: false,
      ),
    );
  }
}
