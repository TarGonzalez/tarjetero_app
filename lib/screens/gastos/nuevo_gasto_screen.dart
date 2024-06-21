import 'package:flutter/material.dart';

class NuevoGastoScreen extends StatelessWidget {
  const NuevoGastoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nueva Gasto'),
      ),
      body: const Center(
        child: Text('Pantalla para dar de alta nuevo gasto'),
      ),
    );
  }
}
