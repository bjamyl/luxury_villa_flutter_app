import 'package:flutter/material.dart';
import '../constants.dart';

class MyButton extends StatelessWidget {
  const MyButton(
      {super.key,
      required this.color,
      required this.icon,
      required this.setPage});

  final Color color;
  final IconData icon;
  final VoidCallback setPage;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(16)),
        height: 60,
        width: 60,
        child: IconButton(
          onPressed: setPage,
          icon: Icon(icon),
          color: Colors.white,
        ));
  }
}
