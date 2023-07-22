import 'package:flutter/material.dart';
import 'package:know_your_game/utils/theme/colors.dart';

class KygContainer extends StatelessWidget {
  const KygContainer({
    super.key,
    this.height,
    this.width,
    this.margin,
    this.padding,
    this.color,
    this.borderColor,
    this.boxShadow,
    this.child,
  });

  final double? height;
  final double? width;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Color? color;
  final Color? borderColor;
  final List<BoxShadow>? boxShadow;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? null,
      width: width ?? null,
      padding: padding ?? EdgeInsets.all(8),
      margin: margin ?? EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: borderColor ?? ColorsUiTheme.mainBorder,
          width: 2.0,
        ),
        boxShadow: boxShadow ??
            [
              BoxShadow(
                  color: ColorsUiTheme.mainBorder,
                  offset: const Offset(
                    0.0,
                    2.0,
                  ))
            ],
      ),
      child: child ?? Container(),
    );
  }
}
