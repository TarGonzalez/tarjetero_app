import 'package:flutter/material.dart';

class NuevaCompraScreen extends StatelessWidget {
  const NuevaCompraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nueva Compra'),
      ),
      body: const Center(
        child: Text('Pantalla para dar de alta nueva compra'),
      ),
    );
  }
}
