import 'package:flutter/material.dart';

class customSafearea extends StatelessWidget {
  final Widget child;
  final Color? topcolor;
  // final Color? bottomcolor;
  const customSafearea({
    super.key,
    required this.child,
    this.topcolor,
    // this.bottomcolor,
  });

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding;

    return Container(
      height: padding.top,
      width: double.infinity,
      color: topcolor ?? Colors.white,

      child: SafeArea(bottom: true, top: true, child: child),
    );

    // SafeArea(
    //   bottom: true,
    //   top: false,
    //   child: Container(
    //     height: padding.bottom,
    //     width: double.infinity,
    //   color: bottomcolor ?? Colors.white,
    // ))
  }
}
