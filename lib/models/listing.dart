class Listing {
  final int id;
  final String title;
  final String country;
  final String city;
  final String description;
  final String pricePerDay;
  final int pricePerYear;
  final int sqft;
  final int bedrooms;
  final int bathrooms;
  final String imgDir;

  const Listing(
      {required this.id,
      required this.title,
      required this.country,
      required this.city,
      required this.description,
      required this.pricePerDay,
      required this.pricePerYear,
      required this.sqft,
      required this.bedrooms,
      required this.bathrooms,
      required this.imgDir});
}
