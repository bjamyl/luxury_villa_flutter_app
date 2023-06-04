import 'package:flutter/material.dart';
import '../constants.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.color,
    required this.icon,
  });

  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(16)),
        height: 60,
        width: 60,
        child: IconButton(
          onPressed: () {},
          icon: Icon(icon),
          color: Colors.white,
        ));
  }
}
