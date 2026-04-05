import 'package:flutter/material.dart';
import 'package:urok39/domain/usecase/get_meal_usecase.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required GetMealUsecase usecs})
    : _usecase = usecs;
  final GetMealUsecase _usecase;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: FutureBuilder(
          future: _usecase.getMeals(),
          builder: (context, snapshot) {
            final data = snapshot.data;
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator.adaptive());
            }

            if (data!.isSuccess) {
              final list = data!.data;
              return Center(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    final item = list![index];
                    return Container(
                      child: Column(
                        children: [
                          Text("name: ${item.name}"),
                          Text("rating: ${item.rating}"),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(height: 10),
                  itemCount: list!.length,
                ),
              );
            }
            return Center(child: Text(data.error.toString()));
          },
        ),
      ),
    );
  }
}
