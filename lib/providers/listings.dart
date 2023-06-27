import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import './listing.dart';

class Listings with ChangeNotifier {
  List<Listing> _listings = [];

  //Using a getter to call items
  List<Listing> get items {
    return [..._listings];
  }

  // Future<List<Listing>> getListingsList() async {
  //   final url = Uri.parse('http://10.0.2.2:8000/api/listings/');
  //   final response = await http.get(url);

  //   final items = json.decode(response.body).cast<Map<String, dynamic>>();
  //   List<Listing> listings = items.map<Listing>((json) {
  //     return Listing.fromJson(json);
  //   }).toList();

  //   return listings;
  // }

  Future<void> fetchAndSetListings() async {
    final url = Uri.parse('http://10.0.2.2:8000/api/listings/');
    try {
      final response = await http.get(url);
      final extractedData =
          json.decode(response.body).cast<Map<String, dynamic>>();
      List<Listing> listings = extractedData.map<Listing>((json) {
        return Listing.fromJson(json);
      }).toList();
      _listings = listings;
      print('Fetch function run');
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
