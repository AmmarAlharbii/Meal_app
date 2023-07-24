import 'package:flutter/material.dart';
import 'package:meals/screen/categories.dart';
import 'package:meals/screen/meal.dart';

import '../model/meal.dart';

class TabBottomBar extends StatefulWidget {
  const TabBottomBar({super.key});

  @override
  State<TabBottomBar> createState() => _TabBottomBarState();
}

class _TabBottomBarState extends State<TabBottomBar> {
  int _selectedIndex = 0;
  final List<Meal> _favoriteMealList = [];
  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _toggleFavoriteMeal(Meal meal) {
    // controll the favorite list
    bool isExisted = _favoriteMealList.contains(meal);
    if (isExisted) {
      _favoriteMealList.remove(meal);
    } else {
      _favoriteMealList.add(meal);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage =
        CategoriesScreen(toggleFavoriteMeal: _toggleFavoriteMeal);
    String activePageTitle = 'Categories';
    if (_selectedIndex == 1) {
      activePage = MealsScreen(
        meals: [],
        toggleFavoriteMeal: _toggleFavoriteMeal,
      );
      activePageTitle = 'Favoraite';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
        centerTitle: true,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
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
