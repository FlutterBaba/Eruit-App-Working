import 'package:flutter/material.dart';

import '../Models/quick_select_model.dart';
import '../const.dart';

class MyDropDown extends StatelessWidget {
  final List<Datum> items;
  final void Function(Datum?)? onChanged;
  final String labelText;
  const MyDropDown(
      {super.key,
      required this.items,
      this.onChanged,
      required this.labelText});
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
        child: DropdownButtonFormField<Datum>(
      decoration: InputDecoration(
        labelText: labelText,
      ),
      itemHeight: 60,
      style: const TextStyle(
        fontSize: 17,
      ),
      value: items.first,
      icon: const Icon(Icons.keyboard_arrow_down),
      items: items.map(
        (Datum items) {
          return DropdownMenuItem(
            value: items,
            child: Text(
              items.text,
              style: const TextStyle(color: klightTextColor),
            ),
          );
        },
      ).toList(),
      onChanged: onChanged,
      isExpanded: true,
    ));
  }
}
