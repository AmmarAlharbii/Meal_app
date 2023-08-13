import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'meal_provider.dart';

enum Filter { gluttenFree, lactoseFree, vegetarian, vegan }

class FiltersNotifire extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifire()
      : super({
          Filter.gluttenFree: false,
          Filter.lactoseFree: false,
          Filter.vegan: false,
          Filter.vegetarian: false,
        });

  void setFilters(Map<Filter, bool> chosenFilter) {
    //assign all filters
    state = chosenFilter;
  }

  void setFilter(Filter filter, bool isActive) {
    state = {...state, filter: isActive}; // set filters with same state
  }
}

// filter provider
final filterProvider =
    StateNotifierProvider<FiltersNotifire, Map<Filter, bool>>(
        (ref) => FiltersNotifire());

final filterMealProvider = Provider((ref) {
  //return filterd meals list with combine two providers meal and filters provider
  final meal = ref.watch(mealProvider); //1 provider
  final activeFilter = ref.watch(filterProvider); //2 provider
  return meal.where((meal) {
    // # this condition need to review
    if (activeFilter[Filter.gluttenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (activeFilter[Filter.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (activeFilter[Filter.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    if (activeFilter[Filter.vegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});
