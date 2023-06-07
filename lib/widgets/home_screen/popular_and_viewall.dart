import 'package:flutter/material.dart';
import '../../constants.dart';

class PopularAndViewAll extends StatelessWidget {
  const PopularAndViewAll({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
