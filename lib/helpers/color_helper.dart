import 'package:flutter/material.dart';

import '/themes/color_palette.dart';

class ColorHelper {
  static Color obtenerColor(String colorNombre) {
    Color color;
    switch (colorNombre) {
      case 'rojo':
        color = colorRojo;
        break;
      case 'azul':
        color = colorAzul;
        break;
      case 'cyan':
        color = colorCyan;
        break;
      case 'cafe':
        color = colorCafe;
        break;
      case 'rosa':
        color = colorRosa;
        break;
      case 'lima':
        color = colorLima;
        break;
      case 'oro':
        color = colorOro;
        break;
      default:
        color = colorMorado;
    }
    return color;
  }
}
