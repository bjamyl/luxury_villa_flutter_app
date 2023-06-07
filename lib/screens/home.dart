import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import '../models/post.dart';
import '../models/data_model.dart';
import '../constants.dart';
import '../widgets/home_screen/discover_card.dart';
import '../widgets/home_screen/my_appbar_title.dart';
import '../widgets/home_screen/search_and_settings.dart';
import '../widgets/home_screen/popular_and_viewall.dart';
import '../widgets/home_screen/listing_card.dart';
import '../listing_dat.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  static const routeName = '/home';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isLoading = true;

  @override
  void initState() {
    _getData();
    super.initState();
  }

  DataModel? dataFromAPI;
  _getData() async {
    try {
      String url = 'https://dummyjson.com/produts';
      http.Response res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        dataFromAPI = DataModel.fromJson(json.decode(res.body));
        _isLoading = false;
        debugPrint(dataFromAPI as String);
        setState(() {});
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

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
            PopularAndViewAll(),
            SizedBox(
              height: 230,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: LISTINGS_DATA.length,
                  itemBuilder: (ctx, i) {
                    return ListingCard(
                      title: LISTINGS_DATA[i].title,
                      city: LISTINGS_DATA[i].city,
                      country: LISTINGS_DATA[i].country,
                      price: LISTINGS_DATA[i].pricePerDay,
                      imgDir: LISTINGS_DATA[i].imgDir,
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
