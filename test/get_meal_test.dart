import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:urok39/data/repository/meal_repository_mock_impl.dart';
import 'package:urok39/domain/entity/meal_entity.dart';
import 'package:urok39/domain/repository/meals_repository.dart';
import 'package:urok39/domain/result.dart';
import 'package:urok39/domain/usecase/get_meal_usecase.dart';

void main() {
  late MealsRepository mockRepository;
  late GetMealUsecase usecase;

  setUp(() {
    mockRepository = MealRepositoryMockImpl();
    usecase = GetMealUsecase(repository: mockRepository);
  });

  test('success test with meals', () async {
    final fakeMeals = [
      MealEntity(name: "name", id: 1, image: "image", rating: 12),
    ];

    when(
      () => mockRepository.getMeals(),
    ).thenAnswer((_) async => Result.success(fakeMeals));
    final result = await usecase.getMeals();

    expect(result.isSuccess, true);
    expect(result.data, fakeMeals);
    verify(() => mockRepository.getMeals()).called(1);
  });

  test('failure test', () async {
    when(
      () => mockRepository.getMeals(),
    ).thenAnswer((_) async => Result.failure("error"));

    final result = await usecase.getMeals();

    expect(result.isFailure, true);
    expect(result.error, "error");
    verify(() => mockRepository.getMeals()).called(1);
  });
}
