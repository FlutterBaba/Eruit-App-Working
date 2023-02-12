import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yaqoob_test_project/Models/order_details_model.dart';

import '../../../const.dart';

//   order details OrderDetailsEvents .... list

class OrderDetailsEvents extends StatelessWidget {
  final OrderDetailsModel orderDetailsModel;
  const OrderDetailsEvents({super.key, required this.orderDetailsModel});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: orderDetailsModel.data!.events!
            .map(
              (events) => Padding(
                padding: const EdgeInsets.all(12.0),
                child: CupertinoButton(
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  child: Column(
                    children: [
                      Container(
                        height: 140,
                        width: 250,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(orderImage),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Transform.translate(
                        offset: const Offset(0, -40),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 20,
                          ),
                          width: 230,
                          decoration: BoxDecoration(
                            color: kwhiteColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    events.hallName!,
                                    style: const TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const Text(
                                    "Start Time - End Time",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: klightTextColor,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Text(
                                        "${events.fromTime}\t-\t",
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: ktextColor,
                                        ),
                                      ),
                                      Text(
                                        "${events.toTime}",
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: ktextColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const Icon(Icons.arrow_forward_ios)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
