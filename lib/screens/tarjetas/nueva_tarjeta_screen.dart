import 'package:flutter/material.dart';

class NuevaTarjetaScreen extends StatelessWidget {
  const NuevaTarjetaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nueva Tarjeta'),
      ),
      body: const Center(
        child: Text('Pantalla para dar de alta nueva tarjeta'),
      ),
    );
  }
}
