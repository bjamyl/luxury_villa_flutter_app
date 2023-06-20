import 'package:flutter/material.dart';
import '../constants.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  static const routeName = '/signin';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: Image.asset('assets/images/logo.png'),
          ),
          const SizedBox(
            height: 70,
          ),
          Container(
            padding: const EdgeInsets.only(left: 34, bottom: 20),
            alignment: Alignment.centerLeft,
            child: const Text(
              "Let's Sign You In",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 34),
            child: Form(
                child: Column(
              children: const [
                SearchBar(
                  hintText: 'johndoe@mail.com',
                  icon: Icons.mail,
                  labelName: "Email ID*",
                ),
                SizedBox(
                  height: 20,
                ),
                SearchBar(
                  hintText: 'Enter password',
                  icon: Icons.remove_red_eye_outlined,
                  labelName: "Password",
                )
              ],
            )),
          )
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
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
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
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
