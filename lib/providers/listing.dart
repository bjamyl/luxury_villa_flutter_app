import 'dart:convert';

Listing listingFromJson(String str) => Listing.fromJson(json.decode(str));

String listingToJson(Listing data) => json.encode(data.toJson());

class Listing {
    int id;
    String title;
    String city;
    String country;
    String description;
    int pricePerDay;
    int pricePerYear;
    int sqft;
    int bedrooms;
    String bathrooms;
    String photo;
    bool isPublished;
    DateTime listDate;

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

    factory Listing.fromJson(Map<String, dynamic> json) => Listing(
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
        listDate: DateTime.parse(json["list_date"]),
    );

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
