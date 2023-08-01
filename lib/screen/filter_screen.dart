import 'package:flutter/material.dart';
import 'package:meals/widget/switch_tile.dart';

enum Filter { gluttenFree, lactoseFree, vegetarian, vegan }

class FilterScreen extends StatefulWidget {
  FilterScreen({super.key, required this.cureentFilter});
  Map<Filter, bool> cureentFilter;

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _gluttenFreeFilter = false;

  var _lactoseFreeFilter = false;

  var _vegetarianFreeFilter = false;

  var _veganFreeFilter = false;

  @override
  void initState() {
    super.initState();
    _gluttenFreeFilter = widget.cureentFilter[Filter.gluttenFree]!;
    _lactoseFreeFilter = widget.cureentFilter[Filter.lactoseFree]!;
    _vegetarianFreeFilter = widget.cureentFilter[Filter.vegetarian]!;
    _veganFreeFilter = widget.cureentFilter[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filter'),
        centerTitle: true,
      ),
      body: WillPopScope(
        //this widget to return data when the screen is closed
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.gluttenFree: _gluttenFreeFilter,
            Filter.lactoseFree: _lactoseFreeFilter,
            Filter.vegan: _veganFreeFilter,
            Filter.vegetarian: _vegetarianFreeFilter
          });
          return false;
        },
        child: Column(
          children: [
            SwitchTileWidget(
              title: 'Glutten-free',
              subTitle: 'all meals without glutten',
              value: _gluttenFreeFilter,
              onChanged: (val) {
                setState(() {
                  _gluttenFreeFilter = val;
                });
              },
            ),
            SwitchTileWidget(
              title: 'Lactose-free',
              subTitle: 'all meals without lactose',
              value: _lactoseFreeFilter,
              onChanged: (val) {
                setState(() {
                  _lactoseFreeFilter = val;
                });
              },
            ),
            SwitchTileWidget(
              title: 'Vegetarian-free',
              subTitle: 'all meals without vegetarian',
              value: _vegetarianFreeFilter,
              onChanged: (val) {
                setState(() {
                  _vegetarianFreeFilter = val;
                });
              },
            ),
            SwitchTileWidget(
              title: 'Vegan-free',
              subTitle: 'all meals without vegan',
              value: _veganFreeFilter,
              onChanged: (val) {
                setState(() {
                  _veganFreeFilter = val;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
