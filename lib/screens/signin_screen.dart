import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';
import '../constants.dart';
import '../widgets/generic_text_field.dart';
import '../widgets/password_text_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static const routeName = '/signin';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _signInformKey = GlobalKey();

  var isLoading = false;

  Future<void> _submit() async {
    if (!_signInformKey.currentState!.validate()) {
      return;
    }
    _signInformKey.currentState?.save();
    setState(() {
      isLoading = true;
    });
    //Log User in
    await Provider.of<Auth>(context, listen: false).login();

    setState(() {
      isLoading = false;
    });
  }

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
              margin: const EdgeInsets.symmetric(horizontal: 34),
              child: Form(
                key: _signInformKey,
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
                      isSignup: false,
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
                  "Don't Have An Account",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                        color: kGradientTop, fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
