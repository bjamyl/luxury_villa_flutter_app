import 'package:flutter/material.dart';
import '../constants.dart';
import './account_screen.dart';
import './favorites_screen.dart';
import './home.dart';
import './messages_screen.dart';
import './near_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});
  static const routeName = '/tabscreen';

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Widget> _pages = const [
    Home(),
    NearScreen(),
    FavoritesScreen(),
    MessagesScreen(),
    AccountScreen()
  ];
  int myIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: myIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color.fromRGBO(242, 247, 255, 1),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: kPrimaryColor,
          unselectedItemColor: Colors.grey,
          onTap: (index) {
            setState(() {
              myIndex = index;
            });
          },
          currentIndex: myIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.near_me), label: 'Near Me'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Favorites'),
            BottomNavigationBarItem(
                icon: Icon(Icons.message_rounded), label: 'Message'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), label: 'Account'),
          ]),
    );
  }
}
