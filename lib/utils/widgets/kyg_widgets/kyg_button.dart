import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import './kyg_container.dart';

class KygButton extends ConsumerWidget {
  const KygButton({
    this.child,
    Key? key,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.color,
    this.borderColor,
    this.shadowColor,
    this.boxShadow,
    this.onTap,
  }) : super(key: key);
  final VoidCallback? onTap;
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Color? color;
  final Color? borderColor;
  final Color? shadowColor;
  final List<BoxShadow>? boxShadow;
  final Widget? child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onTap,
      child: KygContainer(
        height: height,
        width: width,
        padding: padding,
        margin: margin,
        color: color,
        borderColor: borderColor,
        boxShadow: boxShadow,
        child: child,
      ),
    );
  }
}
