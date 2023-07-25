import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withOpacity(0.9),
                ],
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood_outlined,
                  size: 50,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  'Time to eat <3',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                )
              ],
            ),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(
              Icons.restaurant,
              size: 26,
            ),
            title: Text(
              'Meal',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 24),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(
              Icons.settings,
              size: 26,
            ),
            title: Text(
              'Setting',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 24),
            ),
          )
        ],
      ),
    );
  }
}