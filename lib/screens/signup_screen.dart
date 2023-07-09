import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './signin_screen.dart';
import '../constants.dart';
import '../widgets/generic_text_field.dart';
import '../providers/auth.dart';
import '../widgets/password_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const routeName = '/signin';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  var isLoading = false;
  // final _passwordController = TextEditingController();

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
    setState(() {
      isLoading = true;
    });
    //Sign User up
    await Provider.of<Auth>(context, listen: false).signup();
    setState(() {
      isLoading = false;
    });
  }

  bool? isChecked = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                child: Image.asset('assets/images/logo.png'),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.only(left: 34, bottom: 20),
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Get Started!",
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Create an Account to Continue',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(136, 136, 136, 1)),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 34),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const GenericTextField(
                        hintText: 'johndoe@mail.com',
                        icon: Icons.mail,
                        labelName: "Email ID*",
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        child: const PasswordTextField(
                          isSignup: true,
                          hintText: 'Enter password',
                          labelName: "Password",
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 7),
                        child: Row(
                          children: [
                            Checkbox(
                                value: isChecked,
                                onChanged: (newBool) {
                                  setState(() {
                                    isChecked = newBool;
                                  });
                                }),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'By Creating an account you agree to our',
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Color.fromRGBO(160, 164, 171, 1)),
                                ),
                                Text(
                                  'Terms & Conditions',
                                  style: TextStyle(
                                      fontSize: 13, color: kGradientTop),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: _submit,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 29, vertical: 22),
                          decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(16)),
                          width: size.width * 0.75,
                          child: isLoading
                              ? Container(
                                  alignment: Alignment.center,
                                  child: const CircularProgressIndicator(),
                                )
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                      Text(
                                        'Sign Up',
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
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account?',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(SignInScreen.routeName);
                    },
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                          color: kGradientTop, fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
