import 'package:flutter/material.dart';
import 'package:meals/widget/meal_item.dart';

import '../model/meal.dart';

class MealsScreen extends StatelessWidget {
  MealsScreen({required this.title, required this.meals});
  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      //defult widget will display if  meal list is empty
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "sorry no meals here ^_^ ",
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          const SizedBox(height: 16),
          Text(
            "try select diffrent category ",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          )
        ],
      ),
    );
    if (meals.isNotEmpty) {
      // if not empty will display list of meals
      content = ListView.builder(
          //list o view
          itemCount: meals.length, //number of meals will display
          itemBuilder: (context, index) => MealItem(meal: meals[index]));
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: content, //List View
    );
  }
}
