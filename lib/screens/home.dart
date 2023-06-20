import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import '../models/listing.dart';
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

  List? _listings;

  Future<void> getData() async {
    final url = Uri.parse("http://10.0.2.2:8000/api/listings/");
    print('This run');

    try {
      http.Response res = await http.get(url);
      final extractedData = json.decode(res.body);
      final List<Listing> loadedListings = [];
      // extractedData.forEach(
      //   (listingId, listingData) {
      //     loadedListings.add(Listing(
      //         id: listingData['id'],
      //         title: listingData['title'],
      //         country: listingData['country'],
      //         city: listingData['city'],
      //         description: listingData['description'],
      //         pricePerDay: listingData['price_per_day'],
      //         pricePerYear: listingData['price_per_year'],
      //         sqft: listingData['sqft'],
      //         bedrooms: listingData['bedrooms'],
      //         bathrooms: listingData['bathrooms'],
      //         imgDir: listingData['photo']));
      //   },
      // );
      // extractedData.map((listing) {
      //   loadedListings.add(Listing(
      //       id: listing['id'],
      //       title: listing['title'],
      //       country: listing['country'],
      //       city: listing['city'],
      //       description: listing['description'],
      //       pricePerDay: listing['price_per_day'],
      //       pricePerYear: listing['price_per_year'],
      //       sqft: listing['sqft'],
      //       bedrooms: listing['bedrooms'],
      //       bathrooms: listing['bathrooms'],
      //       imgDir: listing['photo']));
      // });

      _listings = loadedListings;
      print(loadedListings);

      // print(extractedData);
    } catch (error) {
      throw error;
    }
  }

  @override
  void initState() {
    print('Initialized');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    getData();
    super.didChangeDependencies();
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
                  itemCount: _listings?.length,
                  itemBuilder: (ctx, i) {
                    return ListingCard(
                      title: _listings?[i]["title"],
                      city: _listings?[i]["city"],
                      country: _listings?[i]["country"],
                      price: _listings?[i]["pricePerDay"],
                      imgDir: _listings?[i]["imgDir"],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
