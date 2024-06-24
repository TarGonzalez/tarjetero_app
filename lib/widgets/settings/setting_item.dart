import 'package:flutter/material.dart';

class SettingItem extends StatelessWidget {
  const SettingItem({
    super.key,
    required this.leadingIcon,
    this.titulo,
    this.onTap,
  });
  final IconData leadingIcon;
  final String? titulo;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        minLeadingWidth: 40,
        title: Text(
          titulo ?? '',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        leading: IconTheme(
          data: Theme.of(context).iconTheme,
          child: Icon(
            leadingIcon,
          ),
        ),
        trailing: IconTheme(
          data: Theme.of(context).iconTheme,
          child: const Icon(
            Icons.chevron_right_rounded,
          ),
        ),
      ),
    );
  }
}
