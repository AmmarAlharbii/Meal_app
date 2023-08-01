import 'package:flutter/material.dart';
import 'package:meals/data/category_data.dart';
import 'package:meals/screen/categories.dart';
import 'package:meals/screen/filter_screen.dart';
import 'package:meals/screen/meal.dart';
import 'package:meals/widget/main_drawer.dart';

import '../model/meal.dart';

const initalFilters = {
  Filter.gluttenFree: false,
  Filter.lactoseFree: false,
  Filter.vegan: false,
  Filter.vegetarian: false,
};

class TabBottomBar extends StatefulWidget {
  const TabBottomBar({super.key});

  @override
  State<TabBottomBar> createState() => _TabBottomBarState();
}

class _TabBottomBarState extends State<TabBottomBar> {
  int _selectedIndex = 0;
  final List<Meal> _favoriteMealList = [];
  Map<Filter, bool> _filterList = initalFilters;
  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _snackBarMessage(String message) {
    // function for snack bar message
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  void _toggleFavoriteMeal(Meal meal) {
    // controll the favorite list
    bool isExisted = _favoriteMealList.contains(meal);
    if (isExisted) {
      setState(() {
        _favoriteMealList.remove(meal);
      });
      _snackBarMessage('Favorite meal in no longer here');
    } else {
      setState(() {
        _favoriteMealList.add(meal);
      });
      _snackBarMessage('The meal is add to favorite list ');
    }
  }

  void _setScreen(String screenName) async {
    Navigator.of(context).pop();
    if (screenName == 'Filtters') {
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => FilterScreen(cureentFilter: _filterList),
        ),
      );
      setState(() {
        _filterList = result ?? initalFilters;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final availabMeals = dummyMeals.where((meal) {
      // this condition need to review
      if (_filterList[Filter.gluttenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_filterList[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_filterList[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (_filterList[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();
    Widget activePage = CategoriesScreen(
      toggleFavoriteMeal: _toggleFavoriteMeal,
      availabelmeals: availabMeals,
    );
    String activePageTitle = 'Categories';
    if (_selectedIndex == 1) {
      activePage = MealsScreen(
        meals: _favoriteMealList,
        toggleFavoriteMeal: _toggleFavoriteMeal,
      );
      activePageTitle = 'Favoraite';
    }
    return Scaffold(
      drawer: MainDrawer(onSelectScreen: _setScreen),
      appBar: AppBar(
        title: Text(activePageTitle),
        centerTitle: true,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
          onTap: _selectedPage,
          currentIndex: _selectedIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: "Category",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: "Favoraite",
            )
          ]),
    );
  }
}
