import 'package:urok39/domain/entity/meal_entity.dart';
import 'package:urok39/domain/repository/meals_repository.dart';
import 'package:urok39/domain/result.dart';

class GetMealUsecase {
  GetMealUsecase({required MealsRepository repository})
    : _repository = repository;
  MealsRepository _repository;
  Future<Result<List<MealEntity>>> getMeals() async {
    return await _repository.getMeals();
  }
}
