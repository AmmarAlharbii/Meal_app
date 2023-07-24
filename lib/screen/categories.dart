import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meals/model/category.dart';
import 'package:meals/screen/meal.dart';
import '../widget/category_grid_item.dart';
import '../data/category_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  void _selectCategory(BuildContext context, Category category) {
    //this function to pick the category and move to meals
    final filteredMeals = dummyMeals
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
        builder: ((context) =>
            MealsScreen(title: category.title, meals: filteredMeals)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pick your Category"),
      ),
      body: GridView(
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
                _selectCategory(context, avalibleCategory[i]);
              },
            ) //loop for assign data to grid views
        ],
      ),
    );
  }
}
