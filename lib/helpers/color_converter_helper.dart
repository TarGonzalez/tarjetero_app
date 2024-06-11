import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

class ColorConverterHelper implements JsonConverter<Color?, String?> {
  const ColorConverterHelper();

  @override
  Color? fromJson(String? json) {
    if (json == null) {
      return null;
    }
    return Color(int.parse(json, radix: 16));
  }

  @override
  String? toJson(Color? color) {
    if (color == null) {
      return null;
    }
    return color.value.toRadixString(16).padLeft(8, '0');
  }
}
