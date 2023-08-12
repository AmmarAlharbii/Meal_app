import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/model/meal.dart';

class FavoriteMealNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealNotifier() : super([]);
  void toggleFavoriteMeal(Meal meal) {
    // state is for holding data
    var mealIsFavorite = state.contains(meal);
    if (mealIsFavorite) {
      state = state.where((mealItem) => mealItem.id != meal.id).toList();
      // for removing the meal if it in the favorite list
    } else {
      //adding favorite meal to list
      state = [...state, meal]; //assign new state with new value
    }
  }
}

final favoriteMealProvider = //favorite meal provider contrlloer
    StateNotifierProvider<FavoriteMealNotifier, List<Meal>>(
  (ref) {
    return FavoriteMealNotifier();
  },
);
