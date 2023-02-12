import 'package:flutter/material.dart';

import '../../../../const.dart';
import '../../create_order/create_order.dart';

class FloatButton extends StatelessWidget {
  const FloatButton({super.key});
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      backgroundColor: kpColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
      ),
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const CreateOrder(),
        ));
      },
      child: const Icon(Icons.add),
    );
  }
}
