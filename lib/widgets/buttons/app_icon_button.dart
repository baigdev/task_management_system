import 'package:flutter/material.dart';

class AppIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget icon;
  final bool? highlight;
  const AppIconButton(
      {super.key,
      required this.onPressed,
      required this.icon,
      this.highlight = true});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      highlightColor: highlight == false ? Colors.transparent : null,
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      icon: icon,
    );
  }
}
