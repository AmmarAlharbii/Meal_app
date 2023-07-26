import 'package:flutter/material.dart';

class SwitchTileWidget extends StatelessWidget {
  const SwitchTileWidget(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.value,
      required this.onChanged});
  final String title;
  final String subTitle;
  final bool value;
  final void Function(bool value) onChanged;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      onChanged: onChanged,
      value: value,
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      ),
      subtitle: Text(
        subTitle,
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      ),
      contentPadding: const EdgeInsets.only(left: 20, right: 30),
    );
  }
}
