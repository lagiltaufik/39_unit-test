import 'package:flutter_test/flutter_test.dart';
import 'package:urok39/data/mapper/meal_mapper.dart';

import 'fixtures/meal_fixtures.dart';

void main() {
  test("mapper test 1", () {
    
    final entity = model1.toEntity();

    expect(entity.id, 1);
    expect(entity.name, 'Pizza');
  });

  test("mapper trst 2", () {
    

    final entity = model2.toEntity();
    expect(entity.id, 2);
    expect(entity.name, "Yogurt");
  });

  test("mapper test 3", () {
    

    final entity = model3.toEntity();
    expect(entity.id, 3);
    expect(entity.name, "Burger");
    expect(entity.rating, 4.5);
  });

  test("mapper test 4", () {
    

    final entity = model4.toEntity();
    expect(entity.name, "Pasta");
    expect(entity.rating, 4.8);
  });

  test("mapper test 5", () {
    

    final entity = model5.toEntity();
    expect(entity.name, "Rice");
    expect(entity.rating, 4.5);
  });
}
