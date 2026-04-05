import 'package:urok39/domain/entity/meal_entity.dart';
import 'package:urok39/domain/result.dart';

abstract interface class MealsRepository {
  Future<Result<List<MealEntity>>> getMeals();
}
