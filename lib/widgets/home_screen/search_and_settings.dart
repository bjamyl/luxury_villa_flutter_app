import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../constants.dart';

class SearchAndSettings extends StatelessWidget {
  const SearchAndSettings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 34),
      child: Row(children: [
        Expanded(
          child: Container(
            alignment: Alignment.center,
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: const Color.fromRGBO(242, 247, 255, 1),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                    width: 1.4, color: const Color.fromRGBO(222, 234, 253, 1))),
            child: TextField(
              decoration: InputDecoration(
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  suffixIcon: SvgPicture.asset(
                      fit: BoxFit.scaleDown,
                      color: kAccentColor,
                      'assets/icons/search.svg'),
                  hintText: 'Search for...'),
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                    width: 1.4, color: const Color.fromRGBO(222, 234, 253, 1)),
                color: const Color.fromRGBO(242, 247, 255, 1)),
            child: SvgPicture.asset(
                fit: BoxFit.scaleDown,
                color: kAccentColor,
                'assets/icons/settings.svg'))
      ]),
    );
  }
}
