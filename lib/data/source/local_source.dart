import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:urok39/data/model/meal_model.dart';

class LocalSource {
  LocalSource({required SharedPreferences pref}) : _sharedPr = pref;
  final SharedPreferences _sharedPr;

  final _key = 'meals';

  Future<void> SaveMeals(List<MealModel> meals) async {
    final jsonList = meals
        .map(
          (e) => {
            "name": e.name,
            "id": e.id,
            "image": e.image,
            "rating": e.rating,
          },
        )
        .toList();
    await _sharedPr.setString(_key, jsonEncode(jsonList));
  }

  Future<List<MealModel>> getMeals() async {
    final json = _sharedPr.getString(_key);
    if (json == null) return [];
    final List decoded = jsonDecode(json);
    return decoded.map((e) => MealModel.fromJson(e)).toList();
  }
}
