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
          backgroundColor: Colors.transparent,
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
        body: HomeMain(myFuture: myFuture));
  }
}
