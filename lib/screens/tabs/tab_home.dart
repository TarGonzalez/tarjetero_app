import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/loader.dart';
import '../../widgets/global/global_button.dart';

class TabHome extends StatelessWidget {
  const TabHome({super.key});

  Future<void> _mostrarLoader() async {
    Loader.mostrar();
    await Future<void>.delayed(const Duration(seconds: 2));
    Get.back();
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GlobalButton(
          texto: 'Mostrar loader',
          onPressed: _mostrarLoader,
        ),
      ],
    );
  }
}
