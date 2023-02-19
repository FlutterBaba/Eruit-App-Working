import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../provider/order_summery_provider/order_summery_provider.dart';

class Summary2Tab extends StatefulWidget {
  const Summary2Tab({super.key});

  @override
  State<Summary2Tab> createState() => _Summary2TabState();
}

class _Summary2TabState extends State<Summary2Tab> {
  @override
  Widget build(BuildContext context) {
    OrderSummeryProvider orderSummeryProvider =
        Provider.of<OrderSummeryProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 0),
      child: ListView(
        physics: const ScrollPhysics(parent: ClampingScrollPhysics()),
        shrinkWrap: true,
        children: [
          const SizedBox(
            height: 12.0,
          ),
          TextField(
            readOnly: true,
            onTap: () {
              showCupertinoModalPopup(
                context: context,
                builder: (context) {
                  return SizedBox(
                    height: 250,
                    child: CupertinoDatePicker(
                      initialDateTime: DateTime.now(),
                      backgroundColor: Colors.white,
                      mode: CupertinoDatePickerMode.date,
                      onDateTimeChanged: (value) {
                        setState(() {
                          orderSummeryProvider.dateFinishValue = value;
                          if (value.month < 10) {
                            orderSummeryProvider.dateFinish.text =
                                "${value.year} - 0${value.month} - ${value.day}";
                          } else {
                            orderSummeryProvider.dateFinish.text =
                                "${value.year} - ${value.month} - ${value.day}";
                          }
                        });
                      },
                    ),
                  );
                },
              );
            },
            controller: orderSummeryProvider.dateFinish,
            decoration: const InputDecoration(labelText: "date_finish"),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: orderSummeryProvider.cost,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: "Cost_1"),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: orderSummeryProvider.minPortions,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            decoration: const InputDecoration(labelText: "min portions"),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: orderSummeryProvider.practical,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            decoration: const InputDecoration(labelText: "Practical"),
          ),
          const SizedBox(height: 20),
          IgnorePointer(
            ignoring: orderSummeryProvider.isEditAble,
            child: TextField(
              keyboardType: TextInputType.number,
              controller: orderSummeryProvider.dutyHist,
              decoration: const InputDecoration(labelText: "duty_hist"),
            ),
          ),
          const SizedBox(height: 20),
          IgnorePointer(
            ignoring: orderSummeryProvider.isEditAble,
            child: TextField(
              readOnly: true,
              onTap: () {
                showCupertinoModalPopup(
                  context: context,
                  builder: (context) {
                    return SizedBox(
                      height: 250,
                      child: CupertinoDatePicker(
                        initialDateTime: DateTime.now(),
                        backgroundColor: Colors.white,
                        mode: CupertinoDatePickerMode.date,
                        onDateTimeChanged: (value) {
                          setState(() {
                            orderSummeryProvider.lastUpdateValue = value;
                            if (value.month < 10) {
                              orderSummeryProvider.lastUpdate.text =
                                  "${value.year} - 0${value.month} - ${value.day}";
                            } else {
                              orderSummeryProvider.lastUpdate.text =
                                  "${value.year} - ${value.month} - ${value.day}";
                            }
                          });
                        },
                      ),
                    );
                  },
                );
              },
              controller: orderSummeryProvider.lastUpdate,
              decoration: const InputDecoration(labelText: "last update"),
            ),
          ),
        ],
      ),
    );
  }
}
