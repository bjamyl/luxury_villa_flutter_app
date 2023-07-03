import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/listings.dart';
import './listing_card.dart';
import './search_and_settings.dart';
import './discover_card.dart';
import './popular_and_viewall.dart';

class HomeMain extends StatelessWidget {
  const HomeMain({
    super.key,
    required this.myFuture,
  });

  final Future myFuture;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                              id: listingsData.items[i].id,
                              title: listingsData.items[i].title,
                              city: listingsData.items[i].city,
                              country: listingsData.items[i].country,
                              price:
                                  listingsData.items[i].pricePerDay.toString(),
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
    );
  }
}
