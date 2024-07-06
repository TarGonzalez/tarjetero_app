import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/app_controller.dart';
import '../../controllers/login_controller.dart';
import '../../routes/routes_names.dart';
import '../../utils/modal_utils.dart';
import '../../utils/utils.dart';
import '../../widgets/cuenta_widget.dart';
import '../../widgets/global/global_banner_info.dart';
import '../../widgets/settings/setting_item.dart';

class TabSettings extends StatefulWidget {
  const TabSettings({super.key});

  @override
  State<TabSettings> createState() => _TabSettingsState();
}

class _TabSettingsState extends State<TabSettings> {
  final AppController appController = Get.find<AppController>();
  Future<void> cambiarTheme({required String themeMode}) async {
    try {
      await Utils.cambiarTheme(themeMode: themeMode);
      Get.back();
    } catch (e) {
      ModalUtils.mostrarBottomSheet(
        titulo: 'Opps!',
        altura: Get.height * 0.6,
        contenido: Center(
          child: GlobalBannerInfo(
            informacion: Utils.limpiarException(e),
          ),
        ),
      );
    }
  }

  Future<void> cerrarSesion() async {
    try {
      await Get.find<LoginController>().sesionEliminarDatos();
      Get.offAllNamed(nameLoginScreen);
    } catch (e) {
      ModalUtils.mostrarBottomSheet(
        titulo: 'Opps!',
        altura: Get.height * 0.6,
        contenido: Center(
          child: GlobalBannerInfo(
            informacion: Utils.limpiarException(e),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<SettingItem> temasOpciones = <SettingItem>[
      SettingItem(
        titulo: 'Sistema defaut',
        leadingIcon: Icons.perm_device_information_rounded,
        onTap: () async => cambiarTheme(themeMode: 'default'),
        mostrarTrailing: 'no',
      ),
      SettingItem(
        titulo: 'Claro',
        leadingIcon: Icons.light_mode,
        onTap: () async => cambiarTheme(themeMode: 'light'),
        mostrarTrailing: 'no',
      ),
      SettingItem(
        titulo: 'Oscuro',
        leadingIcon: Icons.dark_mode,
        onTap: () async => cambiarTheme(themeMode: 'oscuro'),
        mostrarTrailing: 'no',
      ),
    ];
    Future<void> mostrarModalTemas() async {
      ModalUtils.mostrarBottomSheet(
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
      SettingItem(
        titulo: 'Cerrar sesión',
        leadingIcon: Icons.logout_outlined,
        onTap: () async => cerrarSesion(),
        mostrarTrailing: 'no',
      ),
    ];

    return Column(
      children: <Widget>[
        const CuentaWidget(),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: settingsOpciones.length,
          itemBuilder: (BuildContext context, int index) {
            return settingsOpciones[index];
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider();
          },
        ),
      ],
    );
  }
}
