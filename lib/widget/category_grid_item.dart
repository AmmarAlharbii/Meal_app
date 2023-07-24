import 'package:flutter/material.dart';
import '../model/category.dart';

class CategoryGridIem extends StatelessWidget {
  const CategoryGridIem(
      {super.key, required this.category, required this.selectCategory});
  final Category category; //category Obj
  final void Function() selectCategory;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectCategory, //when tap the screen will change
      splashColor: Theme.of(context).primaryColorDark,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          //style the Container border
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
              //style the Container color
              colors: [
                category.color.withOpacity(0.55),
                category.color.withOpacity(0.9),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
        child: Text(
          category.title,
          style: Theme.of(
                  context) //style text color and font with the theme in main class
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
      ),
    );
  }
}
