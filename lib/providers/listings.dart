import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import './listing.dart';

class Listings with ChangeNotifier {
  List<Listing> _listings = [];

  List<Listing> get listings {
    return [..._listings];
  }

  Future<void> fetchListings() async {
    final url = Uri.parse('http://10.0.2.2:8000/api/listings/');

    try {
      final response = await http.get(url);

      final items = json.decode(response.body).cast<Map<String, dynamic>>();

      List<Listing> loadedListings = items.map<Listing>((json) {
        return Listing.fromJson(json);
      }).toList();

      _listings = loadedListings;
      print('Run, so the data should display');
      print(items);

      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
