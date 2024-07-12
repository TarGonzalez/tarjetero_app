import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../helpers/color_helper.dart';

class GlobalSeleccionColor extends StatelessWidget {
  const GlobalSeleccionColor({
    super.key,
    this.onTap,
  });
  final void Function(String)? onTap;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
      ),
      itemCount: coloresSeleccion.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            if (onTap != null) {
              onTap!(coloresSeleccion[index]);
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                coloresSeleccion[index].toUpperCase(),
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const SizedBox(height: 6),
              Stack(
                children: <Widget>[
                  Container(
                    width: 67,
                    height: 42,
                    decoration: BoxDecoration(
                      color: ColorHelper.obtenerColor(coloresSeleccion[index]),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Container(
                      width: 67,
                      height: 9,
                      decoration: BoxDecoration(
                        color: Colors.black87,
                        border: Border(
                          left: BorderSide(
                            color: ColorHelper.obtenerColor(
                                coloresSeleccion[index]),
                            width: 0.1,
                          ),
                          right: BorderSide(
                            color: ColorHelper.obtenerColor(
                                coloresSeleccion[index]),
                            width: 0.1,
                          ),
                        ),
                      ),
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
