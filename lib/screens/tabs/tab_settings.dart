import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../themes/app_theme.dart';
import '../../widgets/global/global_button.dart';

class TabSettings extends StatefulWidget {
  const TabSettings({super.key});

  @override
  State<TabSettings> createState() => _TabSettingsState();
}

class _TabSettingsState extends State<TabSettings> {
  bool isDarkMode = false;
  @override
  Widget build(BuildContext context) {
    void cambiarTheme() {
      setState(() {
        isDarkMode = !isDarkMode;
      });
      Get.changeTheme(!isDarkMode ? themeLight : themeDark);
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GlobalButton(
          onPressed: cambiarTheme,
          texto: 'CAMBIAR TEMA',
        ),
      ],
    );
  }
}
