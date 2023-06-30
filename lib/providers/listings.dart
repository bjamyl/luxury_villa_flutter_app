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

  // Fetch and set products from REST API
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

  Listing findItemById(int id) {
    return _listings.firstWhere((listing) => listing.id == id);
  }
}
