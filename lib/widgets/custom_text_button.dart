import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {super.key,
      required this.buttonText,
      required this.icon,
      required this.color});

  final String buttonText;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 60,
      alignment: Alignment.center,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(16)),
      width: size.width * 0.5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(children: [
            Text(
              buttonText,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 18),
            ),
            const SizedBox(
              width: 10,
            ),
            Icon(
              icon,
              color: Colors.white,
            )
          ]),
        ],
      ),
    );
  }
}
