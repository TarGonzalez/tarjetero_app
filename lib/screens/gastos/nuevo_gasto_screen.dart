import 'package:flutter/material.dart';

import '../../themes/color_palette.dart';
import '../../widgets/global/gradiant_app_bar.dart';

class NuevoGastoScreen extends StatelessWidget {
  const NuevoGastoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: GradientAppBar(
          title: Text('Nuevo Gasto'), boxDecoration: ligthLinearGradient),
      body: Center(
        child: Text('Pantalla para dar de alta nuevo gasto'),
      ),
    );
  }
}
