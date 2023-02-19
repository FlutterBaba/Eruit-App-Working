import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yaqoob_test_project/const.dart';
import 'package:yaqoob_test_project/provider/order_summery_provider/order_summery_provider.dart';

import 'tabs/summary_1_tab.dart';
import 'tabs/summary_2_tab.dart';
import 'tabs/summary_3_tab.dart';

class OrderSummary extends StatefulWidget {
  const OrderSummary({super.key});

  @override
  State<OrderSummary> createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
  @override
  void initState() {
    OrderSummeryProvider orderSummeryProvide =
        Provider.of<OrderSummeryProvider>(context, listen: false);
    orderSummeryProvide.getOrdersSummery();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    OrderSummeryProvider summeryProvider =
        Provider.of<OrderSummeryProvider>(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        bottomNavigationBar: summeryProvider.isEditLoading
            ? SizedBox.fromSize()
            : Container(
                padding: const EdgeInsets.all(18),
                color: const Color(0xffF9FAFB),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () {
                            summeryProvider.orderSummeryVaildtion();
                          },
                          child: summeryProvider.isLoading
                              ? const Center(
                                  child: SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              : const Text("Save"),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: SizedBox(
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: const BorderSide(color: Colors.black),
                            ),
                            backgroundColor: const Color(0xffF9FAFB),
                          ),
                          child: const Text(
                            "Cancel",
                            style: TextStyle(color: ktextColor),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
        appBar: AppBar(
          leading: const BackButton(),
          title: const Text("Create Order"),
        ),
        body: summeryProvider.isEditLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  const SizedBox(height: 20),
                  const ListTile(
                    leading: Text(
                      "Summary 1",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xffE4E6EF),
                      ),
                      child: TabBar(
                        unselectedLabelStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                        unselectedLabelColor: ktextColor,
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: kpColor,
                        ),
                        tabs: const [
                          Tab(
                            text: "Summary 1",
                          ),
                          Tab(
                            text: "Summary 2",
                          ),
                          Tab(
                            text: "Summary 3",
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Expanded(
                    child: TabBarView(
                      children: [
                        Summary1Tab(),
                        Summary2Tab(),
                        Summary3Tab(),
                      ],
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
