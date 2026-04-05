import 'package:urok39/data/model/meal_model.dart';
import 'package:urok39/domain/entity/meal_entity.dart';

extension MealMapper on MealModel {
  MealEntity toEntity() {
    return MealEntity(name: name, id: id, image: image, rating: rating);
  }
}
