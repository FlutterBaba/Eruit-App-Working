import 'package:flutter/material.dart';

import '../Models/quick_select_model.dart';
import '../const.dart';

class MyDropDown extends StatelessWidget {
  final List<Datum> items;
  final void Function(Datum?)? onChanged;
  final String labelText;
  final Datum? value;
  const MyDropDown({
    super.key,
    required this.items,
    this.onChanged,
    required this.labelText,
    this.value,
  });
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
      value: value,
      icon: const Icon(Icons.keyboard_arrow_down),
      items: items.map(
        (Datum items) {
          return DropdownMenuItem(
            value: items,
            child: Text(
              labelText == "Order Status" ? items.value : items.text,
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
