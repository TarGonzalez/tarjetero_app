import 'package:flutter/material.dart';

class InputLabel extends StatelessWidget {
  const InputLabel({
    super.key,
    required this.texto,
    this.alineacionHorizontal = CrossAxisAlignment.start,
  });
  final String texto;
  final CrossAxisAlignment alineacionHorizontal;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: alineacionHorizontal,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            texto,
            style: Theme.of(context).textTheme.displayMedium,
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}
