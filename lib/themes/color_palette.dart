import 'package:flutter/material.dart';

// const Color colorPrimario = Color.fromRGBO(1, 24, 38, 1);
// const Color colorOro = Color.fromRGBO(234, 169, 33, 1);
// const Color colorPlata = Color.fromRGBO(82, 82, 82, 1);
// const Color colorGris200 = Color.fromRGBO(191, 204, 224, 1.0);
// const Color colorGris400 = Color.fromRGBO(171, 184, 214, 1.0);
// const Color colorGris600 = Color.fromRGBO(157, 169, 199, 1.0);
// COLORES PARA TEMA CLARO
const Color colorOro = Color.fromRGBO(234, 169, 33, 1);
const Color colorPrimario = Color.fromRGBO(19, 11, 68, 1);
const Color colorSecundario = Color.fromRGBO(213, 184, 213, 1);
const Color colorPrimarioDark = Color.fromRGBO(33, 3, 62, 1);
const Color colorSecundarioDark = Color.fromRGBO(180, 82, 140, 1);
const Color colorSecundarioDarker = Color.fromRGBO(146, 105, 169, 1);
const Color colorLight = Color.fromRGBO(236, 235, 252, 1);
const Color colorBackground = Color.fromRGBO(255, 255, 255, 1);
const Color colorTexto = Color.fromRGBO(0, 0, 0, 1);
const List<Color> coloresGradiantBar = <Color>[
  colorPrimario,
  colorPrimario,
  colorSecundario,
];
const BoxDecoration ligthLinearGradient = BoxDecoration(
  gradient: LinearGradient(
    colors: coloresGradiantBar,
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
);

// COLORES PARA TEMA OSCURO
const Color darkColorOro = Color.fromRGBO(234, 169, 33, 1);
const Color darkColorPrimario = Color.fromRGBO(19, 11, 68, 1);
const Color darkColorSecundario = Color.fromRGBO(213, 184, 213, 1);
const Color darkColorPrimarioDark = Color.fromRGBO(1, 24, 38, 1);
const Color darkColorSecundarioDark = Color.fromRGBO(180, 82, 140, 1);
const Color darkColorSecundarioDarker = Color.fromRGBO(245, 245, 245, 1);
const Color darkColorLight = Color.fromRGBO(236, 235, 252, 1);
const Color darkColorBackground = Color.fromRGBO(50, 50, 50, 1);
const Color darkColorTexto = Color.fromRGBO(255, 255, 255, 1);
const List<Color> darkColoresGradiantBar = <Color>[
  darkColorPrimarioDark,
  darkColorPrimarioDark,
  darkColorSecundario,
];
const BoxDecoration darkLinearGradient = BoxDecoration(
  gradient: LinearGradient(
    colors: darkColoresGradiantBar,
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
);
