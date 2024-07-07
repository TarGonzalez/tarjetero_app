import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import '../../controllers/app_controller.dart';
import '../../themes/color_palette.dart';

class GradientAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GradientAppBar({
    super.key,
    required this.title,
    this.appBarHeight = 56.0,
  });
  final String title;
  final double appBarHeight;

  @override
  Widget build(BuildContext context) {
    final AppController appCtr = Get.find<AppController>();
    return PreferredSize(
      preferredSize: Size.fromHeight(appBarHeight),
      child: AppBar(
        flexibleSpace: Obx(
          () => Container(
            decoration: (appCtr.theme.value == themeTipoLight
                ? ligthLinearGradient
                : darkLinearGradient),
          ),
        ),
        title: Text(title),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);
}
