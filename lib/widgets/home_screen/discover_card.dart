import 'package:flutter/material.dart';
import '../../constants.dart';

class DiscoverCard extends StatelessWidget {
  const DiscoverCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [kGradientTop, kGradientBottom]),
        borderRadius: BorderRadius.circular(20),
      ),
      width: double.infinity,
      margin: const EdgeInsets.all(34),
      height: 130,
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 130,
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 130,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    child: Image.asset(
                      'assets/images/house.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Discover',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  'Find your\nBest Living Places',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
