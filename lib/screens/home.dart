import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants.dart';
import '../widgets/home_screen/discover_card.dart';
import '../widgets/home_screen/my_appbar_title.dart';
import '../widgets/home_screen/search_and_settings.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: MyAppBarTitle(),
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              DiscoverCard(),
              SearchAndSettings(),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 34, vertical: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Popular Nearest You',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'View All',
                      style: TextStyle(color: kPrimaryColor, fontSize: 15),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
