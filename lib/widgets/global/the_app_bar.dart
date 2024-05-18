import 'package:flutter/material.dart';

class TheAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TheAppBar({
    super.key,
    required this.titulo,
  });
  final String titulo;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(titulo),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
