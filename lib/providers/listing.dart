import 'dart:convert';


class Listing {
  late final int id;
  final String title;
  final String city;
  final String country;
  final String description;
  final int pricePerDay;
  final int pricePerYear;
  final int sqft;
  final int bedrooms;
  final String bathrooms;
  final String photo;
  final bool isPublished;
  final DateTime listDate;

  Listing({
    required this.id,
    required this.title,
    required this.city,
    required this.country,
    required this.description,
    required this.pricePerDay,
    required this.pricePerYear,
    required this.sqft,
    required this.bedrooms,
    required this.bathrooms,
    required this.photo,
    required this.isPublished,
    required this.listDate,
  });

  factory Listing.fromJson(Map<String, dynamic> json) {
    return Listing(
        id: json["id"],
        title: json["title"],
        city: json["city"],
        country: json["country"],
        description: json["description"],
        pricePerDay: json["price_per_day"],
        pricePerYear: json["price_per_year"],
        sqft: json["sqft"],
        bedrooms: json["bedrooms"],
        bathrooms: json["bathrooms"],
        photo: json["photo"],
        isPublished: json["is_published"],
        listDate: DateTime.parse(json["list_date"]));
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "city": city,
        "country": country,
        "description": description,
        "price_per_day": pricePerDay,
        "price_per_year": pricePerYear,
        "sqft": sqft,
        "bedrooms": bedrooms,
        "bathrooms": bathrooms,
        "photo": photo,
        "is_published": isPublished,
        "list_date": listDate.toIso8601String(),
      };
}
