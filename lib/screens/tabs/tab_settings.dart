import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../themes/app_theme.dart';
import '../../widgets/settings/setting_item.dart';

class TabSettings extends StatefulWidget {
  const TabSettings({super.key});

  @override
  State<TabSettings> createState() => _TabSettingsState();
}

class _TabSettingsState extends State<TabSettings> {
  bool isDarkMode = false;
  void cambiarTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
    Get.changeTheme(!isDarkMode ? themeLight : themeDark);
  }

  @override
  Widget build(BuildContext context) {
    final List<SettingItem> items = <SettingItem>[
      SettingItem(
        titulo: 'Mi cuenta',
        leadingIcon: Icons.account_circle,
        onTap: () => <void>{},
      ),
      SettingItem(
        titulo: 'Método de pago',
        leadingIcon: Icons.credit_card_rounded,
        onTap: () => <void>{},
      ),
      SettingItem(
        titulo: 'Cambiar tema',
        leadingIcon: Icons.light_mode,
        onTap: () => cambiarTheme(),
      ),
    ];
    return ListView.separated(
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return items[index];
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider();
      },
    );
  }
}
