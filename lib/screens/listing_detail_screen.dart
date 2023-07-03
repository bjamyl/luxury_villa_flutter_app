import 'package:flutter/material.dart';
import 'package:luxury_villa/providers/listing.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import '../widgets/custom_text_button.dart';
import '../providers/listings.dart';

class ListingDetailScreen extends StatelessWidget {
  const ListingDetailScreen({super.key});

  static const routeName = '/listing-detail';

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final route = ModalRoute.of(context);
    final listingId = route!.settings.arguments;
    final loadedProduct = Provider.of<Listings>(context, listen: false)
        .findItemById(listingId as int);
    return Scaffold(
        bottomNavigationBar: BottomAppBar(
            color: const Color.fromRGBO(242, 247, 255, 1),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                      text: TextSpan(
                          text: 'Price',
                          style: const TextStyle(
                              color: kGradientTop,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                          children: [
                        TextSpan(
                            text: '\n\$${loadedProduct.pricePerYear}',
                            style: const TextStyle(
                                color: kAccentColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                        const TextSpan(
                            text: '/Year',
                            style: TextStyle(color: kAccentColor))
                      ])),
                  const CustomTextButton(
                      buttonText: 'Booking Now',
                      icon: Icons.arrow_forward,
                      color: kGradientTop)
                ],
              ),
            )),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: deviceSize.height * 0.55,
                child: Stack(
                  children: [
                    SizedBox(
                      height: deviceSize.height * 0.45,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40)),
                        child: Hero(
                          tag: loadedProduct.id,
                          child: Image.network(
                            'http://10.0.2.2:8000${loadedProduct.photo}',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    ListingDetailsCard(
                        deviceSize: deviceSize, loadedProduct: loadedProduct)
                  ],
                ),
              ),
              const SizedBox(height: 10),
              ListingReviewCard(deviceSize: deviceSize),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                width: deviceSize.width * 0.9,
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Overview',
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: deviceSize.width * 0.9,
                child: Text(
                  loadedProduct.description,
                  style: const TextStyle(
                      fontSize: 14, color: Color.fromRGBO(136, 136, 136, 1)),
                ),
              )
            ],
          ),
        ));
  }
}

class ListingReviewCard extends StatelessWidget {
  const ListingReviewCard({
    super.key,
    required this.deviceSize,
  });

  final Size deviceSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
            width: 1.4, color: const Color.fromRGBO(222, 234, 253, 1)),
        color: const Color.fromRGBO(242, 247, 255, 1),
      ),
      height: 92,
      width: deviceSize.width * 0.9,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Reviews',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: kAccentColor),
              ),
              Row(
                children: [
                  const Icon(Icons.star,
                      color: Color.fromRGBO(230, 194, 40, 1)),
                  RichText(
                      text: const TextSpan(
                          style: TextStyle(
                              color: kAccentColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                          text: '4.5',
                          children: [
                        TextSpan(
                            text: "( 1290 Reviews )",
                            style: TextStyle(color: kAccentColor, fontSize: 15))
                      ]))
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class ListingDetailsCard extends StatelessWidget {
  const ListingDetailsCard({
    super.key,
    required this.deviceSize,
    required this.loadedProduct,
  });

  final Size deviceSize;
  final Listing loadedProduct;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 1,
      child: Container(
        width: deviceSize.width,
        alignment: Alignment.center,
        child: Container(
          padding: const EdgeInsets.all(16),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
                width: 1.4, color: const Color.fromRGBO(222, 234, 253, 1)),
            color: const Color.fromRGBO(242, 247, 255, 1),
          ),
          height: 130,
          width: deviceSize.width * 0.9,
          child: Column(
            children: [
              //Top row containing title, location and price per day
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      text: loadedProduct.title,
                      style: const TextStyle(
                          color: kAccentColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                      children: [
                        TextSpan(
                            style: const TextStyle(fontSize: 14),
                            text:
                                "\n${loadedProduct.city}, ${loadedProduct.country}")
                      ],
                    ),
                  ),
                  RichText(
                    textAlign: TextAlign.right,
                    text: TextSpan(
                        text: '\$${loadedProduct.pricePerDay}',
                        style: const TextStyle(
                            color: kAccentColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                        children: const [
                          TextSpan(
                              text: '\n/Day',
                              style:
                                  TextStyle(color: kGradientTop, fontSize: 15))
                        ]),
                  )
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Bedroom Icon and Text
                  Row(
                    children: const [Icon(Icons.bed), Text('Bedroom')],
                  ),
                  //Bathroom Icon and Text
                  Row(
                    children: const [Icon(Icons.bathtub), Text('Bathroom')],
                  ),
                  //SQFT Icon and Text
                  Row(
                    children: const [Icon(Icons.square_foot), Text('sqft')],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
