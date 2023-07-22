import 'package:flutter/material.dart';

class VipIconButton extends StatelessWidget {
  const VipIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16.0),
      height: 36.0,
      width: 36.0,
      child: Image.asset(
        "assets/vip_icon.png",
        height: 36.0,
      ),
    );
  }
}
