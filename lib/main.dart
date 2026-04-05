import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:urok39/data/repository/meal_repository_impl.dart';
import 'package:urok39/data/source/api_service.dart';
import 'package:urok39/data/source/local_source.dart';
import 'package:urok39/domain/usecase/get_meal_usecase.dart';
import 'package:urok39/presentation/screens/meals_screen.dart';

late final SharedPreferences preferences;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  preferences = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: MealsScreen(
        usecs: GetMealUsecase(
          repository: MealRepositoryImpl(
            service: ApiServiceImpl(),
            local: LocalSource(pref: preferences),
          ),
        ),
      ),
    );
  }
}
