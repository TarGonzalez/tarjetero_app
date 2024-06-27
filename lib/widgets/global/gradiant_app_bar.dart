import 'package:flutter/material.dart';

class GradientAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GradientAppBar({
    super.key,
    required this.title,
    required this.boxDecoration,
    this.appBarHeight = 56.0,
  });
  final Widget title;
  final BoxDecoration boxDecoration;
  final double appBarHeight;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(appBarHeight),
      child: AppBar(
        flexibleSpace: Container(
          decoration: boxDecoration,
        ),
        title: title,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);
}
