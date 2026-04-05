class MealModel {
  MealModel({
    required this.name,
    required this.id,
    required this.image,
    required this.rating,
  });
  final String name;
  final int id;
  final String image;
  final num rating;

  factory MealModel.fromJson(Map<String, dynamic> json) {
    return MealModel(
      name: json["name"],
      id: json["id"],
      image: json["image"],
      rating: json["rating"],
    );
  }
}
