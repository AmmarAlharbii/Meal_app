import 'package:flutter/material.dart';
import 'package:meals/widget/switch_tile.dart';
import 'package:meals/provider/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //to listen to filters change
    final activeFilter = ref.watch(filterProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filter'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SwitchTileWidget(
            title: 'Glutten-free',
            subTitle: 'all meals without glutten',
            value: activeFilter[Filter.gluttenFree]!,
            onChanged: (val) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.gluttenFree, val);
            },
          ),
          SwitchTileWidget(
            title: 'Lactose-free',
            subTitle: 'all meals without lactose',
            value: activeFilter[Filter.lactoseFree]!,
            onChanged: (val) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.lactoseFree, val);
            },
          ),
          SwitchTileWidget(
            title: 'Vegetarian-free',
            subTitle: 'all meals without vegetarian',
            value: activeFilter[Filter.vegetarian]!,
            onChanged: (val) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.vegetarian, val);
            },
          ),
          SwitchTileWidget(
            title: 'Vegan-free',
            subTitle: 'all meals without vegan',
            value: activeFilter[Filter.vegan]!,
            onChanged: (val) {
              ref.read(filterProvider.notifier).setFilter(Filter.vegan, val);
            },
          )
        ],
      ),
    );
  }
}
