import 'package:flutter/material.dart';

class SelectIconButton extends StatelessWidget {
  const SelectIconButton(
      {Key? key,
      required this.selectedIcon,
      required this.icon,
      required this.setSelectedIcon})
      : super(key: key);

  final String selectedIcon;
  final icon;
  final ValueChanged<String> setSelectedIcon;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon['icon'] as IconData),
      color: icon["title"] == selectedIcon ? Colors.blueAccent : Colors.white,
      iconSize: 48,
      onPressed: () {
        setSelectedIcon(icon['title']);
      },
    );
  }
}
