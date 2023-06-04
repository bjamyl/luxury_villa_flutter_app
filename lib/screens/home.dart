import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Text('This is the homepage'),
      ),
    );
  }
}
