import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meals/model/category.dart';
import 'package:meals/screen/meal.dart';
import '../model/meal.dart';
import '../widget/category_grid_item.dart';
import '../data/category_data.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key, required this.availabeMeals})
      : super(key: key);

  final List<Meal> availabeMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      lowerBound: 0,
      upperBound: 1,
      duration: const Duration(milliseconds: 500),
    );
    _animationController.forward(); //make ainmation start
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _selectCategory(BuildContext context, Category category) {
    //this function to pick the category and move to meals
    final filteredMeals = widget.availabeMeals
        .where(
          //matching the category id with meals by condtion
          (meal) => meal.categories.contains(category
              .id), //in the dummyMeals list we add category list to matching
        )
        .toList();
    Navigator.of(context).push(
      //with this widget we deal with stack push and pop Screens
      MaterialPageRoute(
        //route to meal screen
        builder: ((context) => MealsScreen(
              title: category.title,
              meals: filteredMeals,
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      child: GridView(
        //child will never re renderd
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //mange grideview
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.5),
        children: [
          for (int i = 0; i < avalibleCategory.length; i++) //for loop
            CategoryGridIem(
              category: avalibleCategory[i],
              selectCategory: () {
                _selectCategory(
                  context,
                  avalibleCategory[i],
                );
              },
            ) //loop for assign data to grid views
        ],
      ),
      //this widget will re renderd all the time
      builder: (context, child) => SlideTransition(
        position: Tween(
          begin: const Offset(0.0, 0.3),
          end: const Offset(0, 0.0),
        ).animate(
          CurvedAnimation(
              parent: _animationController, curve: Curves.easeInOut),
        ),
        child: child,
      ),
    );
  }
}
