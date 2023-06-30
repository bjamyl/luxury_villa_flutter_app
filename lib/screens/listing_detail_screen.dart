import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
        body: SingleChildScrollView(
      child: Column(children: [
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
              Positioned(
                  bottom: 1,
                  child: Container(
                    width: deviceSize.width,
                    alignment: Alignment.center,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            width: 1.4,
                            color: const Color.fromRGBO(222, 234, 253, 1)),
                        color: Color.fromRGBO(242, 247, 255, 1),
                      ),
                      height: 130,
                      width: deviceSize.width * 0.9,
                      child: Column(
                        children: [
                          Row(),
                          Row(),
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        )
      ]),
    ));
  }
}
