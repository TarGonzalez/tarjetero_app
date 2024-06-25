import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../themes/app_theme.dart';
import '../../utils/modal_utils.dart';
import '../../widgets/settings/setting_item.dart';

class TabSettings extends StatefulWidget {
  const TabSettings({super.key});

  @override
  State<TabSettings> createState() => _TabSettingsState();
}

class _TabSettingsState extends State<TabSettings> {
  void cambiarTheme({required String themeMode}) {
    if (themeMode == 'default') {
      // final Brightness brightness =
      //     WidgetsBinding.instance.platformDispatcher.platformBrightness;
      // themeMode = brightness == Brightness.dark ? 'oscuro' : 'light';
      final int hour = DateTime.now().hour;
      themeMode = hour >= 19 || hour < 7 ? 'oscuro' : 'light';
    }
    if (themeMode == 'light') {
      Get.changeTheme(themeLight);
    } else {
      Get.changeTheme(themeDark);
    }
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    final List<SettingItem> temasOpciones = <SettingItem>[
      SettingItem(
        titulo: 'Sistema defaut',
        leadingIcon: Icons.perm_device_information_rounded,
        onTap: () => cambiarTheme(themeMode: 'default'),
        mostrarTrailing: 'no',
      ),
      SettingItem(
        titulo: 'Claro',
        leadingIcon: Icons.light_mode,
        onTap: () => cambiarTheme(themeMode: 'light'),
        mostrarTrailing: 'no',
      ),
      SettingItem(
        titulo: 'Oscuro',
        leadingIcon: Icons.dark_mode,
        onTap: () => cambiarTheme(themeMode: 'oscuro'),
        mostrarTrailing: 'no',
      ),
    ];
    Future<void> mostrarModalTemas() async {
      ModalUtils.mostrarBottomShet(
        titulo: 'Temas',
        altura: Get.height * 0.4,
        contenido: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: temasOpciones.length,
          itemBuilder: (BuildContext context, int index) {
            return temasOpciones[index];
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider();
          },
        ),
      );
    }

    final List<SettingItem> settingsOpciones = <SettingItem>[
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
        onTap: () => mostrarModalTemas(),
      ),
    ];

    return ListView.separated(
      shrinkWrap: true,
      itemCount: settingsOpciones.length,
      itemBuilder: (BuildContext context, int index) {
        return settingsOpciones[index];
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider();
      },
    );
  }
}
