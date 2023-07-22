import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    required this.appBar,
    this.actions,
    this.leadingWidget,
    this.title,
    super.key,
  });

  final AppBar appBar;
  final List<Widget>? actions;
  final Widget? leadingWidget;
  final Widget? title;

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: actions,
      leading: leadingWidget,
      elevation: 0,
      backgroundColor: const Color(0xFF203361),
      title: title,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(3.0),
        child: Container(
          color: Color.fromARGB(255, 24, 41, 76),
          height: 3.0,
        ),
      ),
    );
  }
}
