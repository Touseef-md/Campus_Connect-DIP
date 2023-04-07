class Meal {
  final String mealId;
  final String shopName;
  final String shopId;
  final String title;
  final String description;
  final List<String> imageUrls;
  final Duration duration;
  final bool isVeg;
  final bool isNonVeg;
  final DateTime openTime;
  final DateTime closeTime;
  final String location;
  final double price;
  final String rating;
  bool isFav;
  Meal({
    required this.mealId,
    required this.shopId,
    required this.closeTime,
    required this.description,
    required this.duration,
    required this.imageUrls,
    required this.isNonVeg,
    required this.isVeg,
    required this.location,
    required this.openTime,
    required this.price,
    required this.rating,
    required this.shopName,
    required this.title,
    this.isFav = false,
  });
}
