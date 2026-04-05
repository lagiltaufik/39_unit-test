import 'package:flutter_test/flutter_test.dart';
import 'package:urok39/data/mapper/meal_mapper.dart';
import 'package:urok39/data/model/meal_model.dart';

void main() {
  test("mapper test 1", () {
    final model = MealModel(name: "Pizza", id: 1, image: "image", rating: 5);
    final entity = model.toEntity();

    expect(entity.id, 1);
    expect(entity.name, 'Pizza');
  });

  test("mapper trst 2", () {
    final model = MealModel(name: "Yogurt", id: 2, image: "image/2", rating: 4);

    final entity = model.toEntity();
    expect(entity.id, 2);
    expect(entity.name, "Yogurt");
  });

  test("mapper test 3", () {
    final model = MealModel(
      name: "Burger",
      id: 3,
      image: "image/3",
      rating: 4.5,
    );

    final entity = model.toEntity();
    expect(entity.id, 3);
    expect(entity.name, "Burger");
    expect(entity.rating, 4.5);
  });

  test("mapper test 4", () {
    final model = MealModel(
      name: "Pasta",
      id: 4,
      image: "image/4",
      rating: 4.8,
    );

    final entity = model.toEntity();
    expect(entity.name, "Pasta");
    expect(entity.rating, 4.8);
  });

  test("mapper test 5", () {
    final model = MealModel(name: "Rice", id: 5, image: "image/5", rating: 4.5);

    final entity = model.toEntity();
    expect(entity.name, "Rice");
    expect(entity.rating, 4.5);
  });
}
