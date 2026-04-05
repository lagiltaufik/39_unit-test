import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:urok39/data/model/meal_model.dart';

abstract interface class ApiService {
  Future<List<MealModel>> getMeals();
}

class ApiServiceImpl implements ApiService {
  @override
  Future<List<MealModel>> getMeals() async {
    final response = await http.get(Uri.parse("https://dummyjson.com/recipes"));
    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      final List data = json["recipes"];
      return data.map((e) => MealModel.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load");
    }
  }
}
