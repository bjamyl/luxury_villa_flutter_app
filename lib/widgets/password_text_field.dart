import 'package:flutter/material.dart';
import '../constants.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    super.key,
    required this.labelName,
    required this.hintText,
  });

  final String labelName;
  final String hintText;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  var _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.labelName,
            style: const TextStyle(
                fontSize: 15, color: Color.fromRGBO(136, 136, 136, 1))),
        const SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
              color: const Color.fromRGBO(222, 234, 253, 1),
              borderRadius: BorderRadius.circular(15)),
          child: Row(
            children: [
              Flexible(
                child: TextFormField(
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    hintText: widget.hintText,
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                  child: Icon(
                    _isObscure
                        ? Icons.visibility_off_outlined
                        : Icons.visibility,
                    color: kAccentColor,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
