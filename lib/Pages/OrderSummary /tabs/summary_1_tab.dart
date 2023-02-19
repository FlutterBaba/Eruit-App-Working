import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:yaqoob_test_project/provider/order_summery_provider/order_summery_provider.dart';

class Summary1Tab extends StatefulWidget {
  const Summary1Tab({super.key});

  @override
  State<Summary1Tab> createState() => _Summary1TabState();
}

class _Summary1TabState extends State<Summary1Tab> {
  @override
  Widget build(BuildContext context) {
    OrderSummeryProvider orderSummeryProvider =
        Provider.of<OrderSummeryProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: OverflowBar(
        overflowSpacing: 20,
        children: [
          IgnorePointer(
            ignoring: orderSummeryProvider.isEditAble,
            child: TextField(
              controller: orderSummeryProvider.addCommon,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: "Add common",
              ),
            ),
          ),
          TextField(
            controller: orderSummeryProvider.numportions,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            decoration: const InputDecoration(labelText: "Num Portions"),
          ),
          TextField(
            controller: orderSummeryProvider.possiblePortions,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            decoration: const InputDecoration(labelText: "Possible Portions"),
          ),
          TextField(
            controller: orderSummeryProvider.addition,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: "Addition 1"),
          ),
          IgnorePointer(
            ignoring: orderSummeryProvider.isEditAble,
            child: TextField(
              controller: orderSummeryProvider.man,
              decoration: const InputDecoration(labelText: "Man 2"),
            ),
          ),
          IgnorePointer(
            ignoring: orderSummeryProvider.isEditAble,
            child: TextField(
              controller: orderSummeryProvider.lastUser,
              decoration: const InputDecoration(labelText: "Last User"),
            ),
          ),
          TextField(
            controller: orderSummeryProvider.text,
            decoration: const InputDecoration(labelText: "Text 1"),
          ),
        ],
      ),
    );
  }
}
