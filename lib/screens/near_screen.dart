import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/listings.dart';
import '../constants.dart';
import '../widgets/home_screen/search_and_settings.dart';

class NearScreen extends StatefulWidget {
  const NearScreen({super.key});

  @override
  State<NearScreen> createState() => _NearScreenState();
}

class _NearScreenState extends State<NearScreen> {
  late Future myFuture;

  @override
  void initState() {
    myFuture =
        Provider.of<Listings>(context, listen: false).fetchAndSetListings();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final tabs = ['All', 'Villa', 'MiniFlat', 'Near You', 'Appartments'];

    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 20),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Nearest You',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: kDarkColor, fontSize: 20),
            ),
          ),
          const SearchAndSettings(),
          Container(
            margin: const EdgeInsets.only(left: 34, top: 20),
            height: 40,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, i) => Tab(
                      title: tabs[i],
                    ),
                separatorBuilder: (ctx, i) => const SizedBox(
                      width: 10,
                    ),
                itemCount: tabs.length),
          ),
          FutureBuilder(
            builder: (ctx, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                if (snapshot.error != null) {
                  return const Center(
                    child: Text('Something went wrong'),
                  );
                } else {
                  return Consumer<Listings>(
                    builder: (ctx, listingsData, child) => Expanded(
                      child: GridView.builder(
                        padding: const EdgeInsets.all(34),
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 200,
                                childAspectRatio: 3 / 2,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20),
                        itemCount: listingsData.items.length,
                        itemBuilder: (ctx, i) => NearListCard(
                            id: listingsData.items[i].id,
                            title: listingsData.items[i].title,
                            imgDir: listingsData.items[i].photo),
                      ),
                    ),
                  );
                }
              }
            },
            future: myFuture,
          ),
        ],
      ),
    ));
  }
}

class NearListCard extends StatelessWidget {
  const NearListCard({
    super.key,
    required this.id,
    required this.imgDir,
    required this.title, required this.city, required this.country,
  });

  final int id;
  final String imgDir;
  final String title;
  final String city;
  final String country;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 171,
          height: 200,
          child: Stack(children: [
            SizedBox(
              height: 100,
              width: 171,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Hero(
                    tag: id,
                    child: Image.network(
                      'http://10.0.2.2:8000$imgDir',
                      fit: BoxFit.cover,
                    )),
              ),
            ),
          ]),
        ),
        Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                  color: kDarkColor, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text("")
          ],
        )
      ],
    );
  }
}

class Tab extends StatelessWidget {
  const Tab({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 11),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(242, 247, 255, 1),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: const Color.fromRGBO(222, 234, 253, 1),
          width: 1.4,
        ),
      ),
      child: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, color: kDarkColor),
      ),
    );
  }
}
