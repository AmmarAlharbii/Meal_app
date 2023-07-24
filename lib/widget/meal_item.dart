import 'package:flutter/material.dart';
import 'package:meals/model/meal.dart';
import 'package:meals/screen/meal_details.dart';
import 'package:meals/widget/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem(
      {super.key, required this.meal, required this.toggleFavoriteMeal});
  final Meal meal;
  final void Function(Meal meal) toggleFavoriteMeal;
  String get complixtyText {
    //return comlicty name with first char is capital
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordabilityText {
    //return comlicty name with first char is capital
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  void _selectedMeal(Meal meal, BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealDetails(
          meal: meal,
          toggleFavoriteMeal: toggleFavoriteMeal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
      ),
      clipBehavior:
          Clip.hardEdge, //clip the card and ignore any widget out of card
      elevation: 3,
      child: InkWell(
        onTap: () {
          _selectedMeal(meal, context);
        },
        child: Stack(
          children: [
            FadeInImage(
              //transition meal image
              placeholder:
                  MemoryImage(kTransparentImage), //first image is transprent
              image: NetworkImage(meal.imageUrl), //the real image
              fit: BoxFit.cover, //image cover all the card
              height: 200, //to make hieght normal not streach
              width: double.infinity, // take all width
            ),
            Positioned(
              //take podition by this fields
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 44),
                color: Colors.black54,
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      overflow:
                          TextOverflow.ellipsis, //very long text will be ...
                      softWrap: true,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                    const SizedBox(height: 14),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        MealItemTrait(
                            icon: Icons.schedule_outlined,
                            label: '${meal.duration} min'),
                        const SizedBox(
                          width: 10,
                        ),
                        MealItemTrait(icon: Icons.work, label: complixtyText),
                        const SizedBox(
                          width: 10,
                        ),
                        MealItemTrait(
                            icon: Icons.attach_money, label: affordabilityText),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
