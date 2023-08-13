import 'package:flutter/material.dart';
import 'package:meals/data/category_data.dart';
import 'package:meals/provider/favorite_provider.dart';
import 'package:meals/provider/meal_provider.dart';
import 'package:meals/screen/categories.dart';
import 'package:meals/screen/filter_screen.dart';
import 'package:meals/screen/meal.dart';
import 'package:meals/widget/main_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals/provider/filters_provider.dart';

class TabBottomBar extends ConsumerStatefulWidget {
  const TabBottomBar({super.key});

  @override
  ConsumerState<TabBottomBar> createState() => _TabBottomBarState();
}

class _TabBottomBarState extends ConsumerState<TabBottomBar> {
  int _selectedIndex = 0;

  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _setScreen(String screenName) async {
    Navigator.of(context).pop();
    if (screenName == 'Filtters') {
      await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => const FilterScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final availabeMeals = ref.watch(filterMealProvider);
    Widget activePage = CategoriesScreen(
      availabeMeals: availabeMeals,
    );
    String activePageTitle = 'Categories';
    if (_selectedIndex == 1) {
      final favoriteMealList =
          ref.watch(favoriteMealProvider); //favorite provider
      activePage = MealsScreen(
        meals: favoriteMealList,
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
