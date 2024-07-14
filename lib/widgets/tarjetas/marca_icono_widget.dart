import 'dart:convert';

import 'package:flutter/material.dart';

class MarcaIconoWidget extends StatelessWidget {
  const MarcaIconoWidget({
    super.key,
    this.ancho = 20,
    this.alto = 16,
    this.icono,
    this.colorBackground = Colors.white,
  });
  final double ancho;
  final double alto;
  final String? icono;
  final Color colorBackground;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ancho,
      height: alto,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: colorBackground,
      ),
      child: icono != null
          ? Image.memory(
              base64Decode(icono!),
              fit: BoxFit.cover,
            )
          : null,
    );
  }
}
