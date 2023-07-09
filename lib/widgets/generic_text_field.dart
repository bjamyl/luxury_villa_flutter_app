import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';
import '../constants.dart';

class GenericTextField extends StatelessWidget {
  const GenericTextField({
    super.key,
    required this.labelName,
    required this.hintText,
    required this.icon,
  });

  final String labelName;
  final String hintText;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final authData = Provider.of<Auth>(context,listen: false).authData;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelName,
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
                  validator: (value) {
                    if (value!.isEmpty || !value.contains('@')) {
                      return 'Invalid email';
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    authData['email'] = newValue!;
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    hintText: hintText,
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Icon(
                  icon,
                  color: kAccentColor,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
