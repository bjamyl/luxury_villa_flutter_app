import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/listing.dart';
import '../constants.dart';
import '../providers/listings.dart';
import '../widgets/home_screen/discover_card.dart';
import '../widgets/home_screen/my_appbar_title.dart';
import '../widgets/home_screen/home_main.dart';
import '../widgets/home_screen/search_and_settings.dart';
import '../widgets/home_screen/popular_and_viewall.dart';
import '../widgets/home_screen/listing_card.dart';
import '../screens/account_screen.dart';
import '../screens/favorites_screen.dart';
import '../screens/messages_screen.dart';
import '../screens/near_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  static const routeName = '/home';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final Future myFuture;

  //Create variable to toggle bottom navigation bar
  int myIndex = 0;

  //Create a list of page widgets to change to from navigation bar
  final List<Widget> myWidgets = [];
  List<Widget> widgetList = [
    const NearScreen(),
    const FavoritesScreen(),
    const MessagesScreen(),
    const AccountScreen(),
  ];

  @override
  void initState() {
    myFuture =
        Provider.of<Listings>(context, listen: false).fetchAndSetListings();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const MyAppBarTitle(),
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 30),
                width: 52,
                height: 52,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/profile.jpg')),
                ),
              )
            ],
          )
        ],
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
      body: myIndex ==  ? HomeMain(myFuture: myFuture) : widgetList[myIndex],
    );
  }
}
