import 'package:flutter/material.dart';

class GlobalIconButton extends StatelessWidget {
  const GlobalIconButton({
    super.key,
    this.icono,
    this.onPressed,
  });
  final IconData? icono;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed!();
      },
      borderRadius: BorderRadius.circular(
        42,
      ), // Esto es importante para que el InkWell respete el radio
      child: Material(
        color: Colors.transparent,
        child: Ink(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(42),
          ),
          child: Container(
            alignment: Alignment.center,
            width: 48,
            height: 48,
            child: Icon(
              icono,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
