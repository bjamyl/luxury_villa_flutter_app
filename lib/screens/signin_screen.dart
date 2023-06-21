import 'package:flutter/material.dart';
import '../constants.dart';
import '../widgets/generic_text_field.dart';
import '../widgets/password_text_field.dart';

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
      body: SingleChildScrollView(
        child: Column(
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
                  children: [
                    const GenericTextField(
                      hintText: 'johndoe@mail.com',
                      icon: Icons.mail,
                      labelName: "Email ID*",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const PasswordTextField(
                      hintText: 'Enter password',
                      
                      labelName: "Password",
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      margin: const EdgeInsets.only(top: 10, bottom: 20),
                      child: const Text('Forgot Password?',
                          style: TextStyle(
                              fontSize: 15,
                              color: Color.fromRGBO(136, 136, 136, 1))),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 29, vertical: 22),
                      decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(16)),
                      width: size.width * 0.75,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Sign In',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.white),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            )
                          ]),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            RichText(
                text: const TextSpan(
                    text: "Don't Have An Account?",
                    style: TextStyle(color: Colors.black),
                    children: [
                  TextSpan(
                      text: 'Sign Up', style: TextStyle(color: kPrimaryColor))
                ]))
          ],
        ),
      ),
    );
  }
}
