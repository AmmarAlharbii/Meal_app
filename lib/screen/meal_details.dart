import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../model/meal.dart';

class MealDetails extends StatelessWidget {
  const MealDetails({super.key, required this.meal});

  final Meal meal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 5),
            child: IconButton(
              icon: Icon(Icons.star),
              onPressed: () {},
            ),
          ),
        ],
        title: Text(
          meal.title,
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: Column(
        children: [
          FadeInImage(
            //transition meal image
            placeholder:
                MemoryImage(kTransparentImage), //first image is transprent
            image: NetworkImage(meal.imageUrl), //the real image
            fit: BoxFit.cover,
            height: 300, //to make hieght normal not streach
            width: double.infinity, // take all width
          ),
          const Text(
            'Ingredients',
            style: TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 195, 149, 89),
            ),
          ),
        ],
      ),
    );
  }
}
