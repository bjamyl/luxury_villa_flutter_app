import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/listing.dart';
import '../providers/listings.dart';
import '../widgets/home_screen/discover_card.dart';
import '../widgets/home_screen/my_appbar_title.dart';
import '../widgets/home_screen/search_and_settings.dart';
import '../widgets/home_screen/popular_and_viewall.dart';
import '../widgets/home_screen/listing_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  static const routeName = '/home';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final Future myFuture;
  @override
  void initState() {
    myFuture =
        Provider.of<Listings>(context, listen: false).fetchAndSetListings();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const DiscoverCard(),
            const SearchAndSettings(),
            const PopularAndViewAll(),
            SizedBox(
              height: 230,
              child: FutureBuilder(
                builder: (ctx, dataSnapshot) {
                  if (dataSnapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    if (dataSnapshot.error != null) {
                      return const Center(
                        child: Text('Something went wrong'),
                      );
                    } else {
                      return Consumer<Listings>(
                        builder: (ctx, listingsData, child) => ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: listingsData.items.length,
                            itemBuilder: (ctx, i) => ListingCard(
                                title: listingsData.items[i].title,
                                city: listingsData.items[i].city,
                                country: listingsData.items[i].country,
                                price: '300',
                                imgDir: listingsData.items[i].photo)),
                      );
                    }
                  }
                },
                future: myFuture,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
