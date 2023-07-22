import 'package:flutter/material.dart';

class FlagIcon extends StatelessWidget {
  const FlagIcon(this.assetString,
      {this.height = 36.0, this.borderRadius = 8.0, super.key});
  final String assetString;
  final double height;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Image.asset(
        assetString,
        height: height,
        fit: BoxFit.cover,
      ),
    );
  }
}
