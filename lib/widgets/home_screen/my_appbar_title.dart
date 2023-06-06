import 'package:flutter/material.dart';
import '../../constants.dart';

class MyAppBarTitle extends StatelessWidget {
  const MyAppBarTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      child: Row(children: [
        const Icon(
          Icons.location_on_outlined,
          color: kDarkColor,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Location',
              style: TextStyle(color: kPrimaryColor, fontSize: 15),
            ),
            Text(
              'Wa, Ghana',
              style: TextStyle(
                  fontSize: 18, color: kDarkColor, fontWeight: FontWeight.bold),
            )
          ],
        )
      ]),
    );
  }
}
