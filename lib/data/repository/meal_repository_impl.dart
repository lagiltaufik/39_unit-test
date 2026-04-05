import 'package:urok39/data/mapper/meal_mapper.dart';
import 'package:urok39/data/source/api_service.dart';
import 'package:urok39/data/source/local_source.dart';
import 'package:urok39/domain/entity/meal_entity.dart';
import 'package:urok39/domain/repository/meals_repository.dart';
import 'package:urok39/domain/result.dart';

class MealRepositoryImpl implements MealsRepository {
  MealRepositoryImpl({required ApiService service, required LocalSource local})
    : _service = service,
      _local = local;

  final ApiService _service;
  final LocalSource _local;

  @override
  Future<Result<List<MealEntity>>> getMeals() async {
    try {
      final cashedData = await _local.getMeals();
      if (cashedData.isNotEmpty) {
        return Result.success(cashedData.map((e) => e.toEntity()).toList());
      }
      final data = await _updateFromServer();
      return Result.success(data);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }

  Future<List<MealEntity>> _updateFromServer() async {
    final freshData = await _service.getMeals();
    await _local.SaveMeals(freshData);
    return freshData.map((e) => e.toEntity()).toList();
  }
}
