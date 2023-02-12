import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yaqoob_test_project/const.dart';

class OrderAppBar extends StatelessWidget {
  const OrderAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(logoSmallImagee),
          const Text(
            "Orders",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SvgPicture.asset(filterIconSvg),
        ],
      ),
    );
  }
}
