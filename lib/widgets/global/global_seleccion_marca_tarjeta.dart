import 'dart:convert';

import 'package:flutter/material.dart';

import '../../models/marca_tarjeta.dart';

class GlobalSeleccionMarcaTarjeta extends StatelessWidget {
  const GlobalSeleccionMarcaTarjeta({
    super.key,
    this.onTap,
    required this.marcasTarjetas,
  });
  final void Function(MarcaTarjeta)? onTap;
  final List<MarcaTarjeta> marcasTarjetas;

  @override
  Widget build(BuildContext context) {
    void onSelect(MarcaTarjeta marcaTarjeta) {
      if (onTap != null) {
        onTap!(marcaTarjeta);
      }
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
      ),
      itemCount: marcasTarjetas.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            onSelect(marcasTarjetas[index]);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                marcasTarjetas[index].nombre!.toUpperCase(),
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const SizedBox(height: 6),
              Stack(
                children: <Widget>[
                  Container(
                    width: 67,
                    height: 42,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.white,
                    ),
                    child: Image.memory(
                      base64Decode(marcasTarjetas[index].icono!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
