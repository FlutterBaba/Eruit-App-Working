import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yaqoob_test_project/const.dart';
import 'package:yaqoob_test_project/provider/order_summery_provider/order_summery_provider.dart';

class Summary3Tab extends StatefulWidget {
  const Summary3Tab({super.key});

  @override
  State<Summary3Tab> createState() => _Summary3TabState();
}

class _Summary3TabState extends State<Summary3Tab> {
  @override
  Widget build(BuildContext context) {
    OrderSummeryProvider orderSummeryProvider =
        Provider.of<OrderSummeryProvider>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Vat"),
                Row(
                  children: [
                    Checkbox(
                      value: orderSummeryProvider.includeVat,
                      activeColor: kpColor,
                      onChanged: (value) {
                        orderSummeryProvider.changeIncludeVatValue(value!);
                      },
                    ),
                    const SizedBox(width: 10),
                    const Text("Note included")
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("discount_2˝"),
                      const SizedBox(height: 5),
                      TextField(
                        keyboardType: TextInputType.number,
                        controller: orderSummeryProvider.discount,
                        decoration: const InputDecoration(labelText: "0.00"),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("%"),
                      const SizedBox(height: 5),
                      TextField(
                        keyboardType: TextInputType.number,
                        controller: orderSummeryProvider.perctage,
                        decoration: const InputDecoration(labelText: "NaN"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            IgnorePointer(
              ignoring: orderSummeryProvider.isEditAble,
              child: TextField(
                keyboardType: TextInputType.number,
                controller: orderSummeryProvider.tSum,
                decoration: const InputDecoration(labelText: "t_sum"),
              ),
            ),
            const SizedBox(height: 20),
            IgnorePointer(
              ignoring: orderSummeryProvider.isEditAble,
              child: TextField(
                keyboardType: TextInputType.number,
                controller: orderSummeryProvider.tMamSum,
                decoration: const InputDecoration(labelText: "t_mam_sum"),
              ),
            ),
            const SizedBox(height: 20),
            IgnorePointer(
              ignoring: orderSummeryProvider.isEditAble,
              child: TextField(
                keyboardType: TextInputType.number,
                controller: orderSummeryProvider.sumTotal,
                decoration: const InputDecoration(labelText: "sum_total"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
