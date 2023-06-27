import 'package:flutter/material.dart';
import '../../constants.dart';

class ListingCard extends StatelessWidget {
  const ListingCard(
      {super.key,
      required this.title,
      required this.city,
      required this.country,
      required this.price,
      required this.imgDir});

  final String title;
  final String city;
  final String country;
  final String price;
  final String imgDir;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      width: 300,
      margin: EdgeInsets.only(left: 34),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage('http://10.0.2.2:8000$imgDir'))),
      child: Stack(children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 36,
                width: 70,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      size: 20,
                      Icons.star,
                      color: kAccentColor,
                    ),
                    Text(
                      '4.2',
                      style: TextStyle(
                          color: kAccentColor, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              const Icon(
                Icons.favorite,
                size: 20,
                color: kAccentColor,
              )
            ],
          ),
        ),
        Positioned(
          bottom: 20,
          left: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                '${city}, ${country}',
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
              RichText(
                  text: TextSpan(
                      text: price,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                      children: [
                    TextSpan(text: ' / MONTH', style: TextStyle(fontSize: 14))
                  ]))
            ],
          ),
        ),
      ]),
    );
  }
}
