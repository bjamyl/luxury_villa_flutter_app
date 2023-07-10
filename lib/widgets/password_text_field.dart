import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';
import '../constants.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    super.key,
    required this.labelName,
    required this.hintText,
    required this.isSignup,
  });

  final String labelName;
  final String hintText;
  final bool isSignup;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  var _isObscure = true;
  var _isConfirmedObscure = true;

  @override
  Widget build(BuildContext context) {
    final authData = Provider.of<Auth>(context, listen: false).authData;

    return Column(
      children: [
        Column(
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
                      validator: (value) {
                        if (value!.isEmpty || value.length < 5) {
                          return 'Password is too short';
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        authData['password'] = newValue!;
                      },
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 20),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        hintText: widget.hintText,
                      ),
                      keyboardType: TextInputType.text,
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
        ),
        const SizedBox(
          height: 20,
        ),
        widget.isSignup
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Confirm Password',
                      style: TextStyle(
                          fontSize: 15,
                          color: Color.fromRGBO(136, 136, 136, 1))),
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
                            obscureText: _isConfirmedObscure,
                            validator: (value) {
                              if (value!.isEmpty || value.length < 5) {
                                return 'Password is too short';
                              }
                              return null;
                            },
                            onSaved: (newValue) {
                              authData['re_password'] = newValue!;
                            },
                            decoration: const InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 20),
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              hintText: 'Retype password',
                            ),
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _isConfirmedObscure = !_isConfirmedObscure;
                              });
                            },
                            child: Icon(
                              _isConfirmedObscure
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
              )
            : const SizedBox(),
      ],
    );
  }
}
