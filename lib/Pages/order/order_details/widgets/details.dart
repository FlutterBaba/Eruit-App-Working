import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:yaqoob_test_project/Models/order_details_model.dart';
import 'package:yaqoob_test_project/Pages/order/create_order/create_order.dart';
import 'package:yaqoob_test_project/provider/order_provider/create_order_provider.dart';
import 'package:yaqoob_test_project/utils/hex_color.dart';
import '../../../../const.dart';

class Details extends StatelessWidget {
  final OrderDetailsModel orderDetailsModel;
  const Details({super.key, required this.orderDetailsModel});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: kwhiteColor.withOpacity(0.4),
        border: Border.all(
          color: kwhiteColor,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(orderImage),
              ),
            ),
          ),
          Transform.translate(
            offset: const Offset(0, -50),
            child: Container(
              padding: const EdgeInsets.all(12),
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 4),
                    blurRadius: 24,
                    color: const Color(0xff000000).withOpacity(0.1),
                    spreadRadius: 0,
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 15),
                    decoration: BoxDecoration(
                      color: kpColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Center(
                      child: Text(
                        DateFormat.MMMd().format(
                          DateTime.parse(
                            orderDetailsModel.data!.lastUpdate.toString(),
                          ),
                        ),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: Text(
                              orderDetailsModel.data!.booking!.name.toString(),
                              style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          SvgPicture.asset(
                            circleIconSvg,
                            color: orderDetailsModel.data!.colorHexa!.toColor(),
                          ),
                        ],
                      ),
                      const Text("#Order No -"),
                      Text(
                        "${orderDetailsModel.data!.order}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.notifications_none_rounded),
                      Transform.scale(
                        scale: 0.7,
                        child: const CupertinoSwitch(
                          value: true,
                          onChanged: null,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: ListTile(
                  title: const Text("Hall"),
                  subtitle: Text(
                    orderDetailsModel.data!.events![0].hallName!..toString(),
                  ),
                ),
              ),
              Expanded(
                child: ListTile(
                  title: const Text("Booking number"),
                  subtitle: Text(
                    orderDetailsModel.data!.booking!.bookingNumber.toString(),
                  ),
                ),
              ),
            ],
          ),
          //Removes everything after first '.'
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: ListTile(
                  title: const Text("Last updated"),
                  subtitle: Text(
                    DateFormat.yMMMd().format(
                      DateTime.parse(
                        orderDetailsModel.data!.lastUpdate.toString(),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListTile(
                  title: const Text("Order date"),
                  subtitle: Text(
                    DateFormat.yMMMd().format(
                      DateTime.parse(
                        orderDetailsModel.data!.lastUpdate.toString(),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          /// static fields.

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: ListTile(
                  title: const Text("Event from time"),
                  subtitle: Text(
                    DateFormat.jm().format(
                      DateFormat("hh:mm:ss").parse(
                        orderDetailsModel.data!.events![0].fromTime.toString(),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListTile(
                  title: const Text("Event to time"),
                  subtitle: Text(
                    DateFormat.jm().format(
                      DateFormat("hh:mm:ss").parse(
                        orderDetailsModel.data!.events![0].toTime.toString(),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: ListTile(
                  title: const Text("Last user"),
                  subtitle: Text(
                    orderDetailsModel.data!.lastUser!.toString(),
                  ),
                ),
              ),
              Expanded(
                child: ListTile(
                  title: const Text("Phone number"),
                  subtitle: Text(
                    orderDetailsModel.data!.booking!.number!.toString(),
                  ),
                ),
              ),
            ],
          ),
          ListTile(
            title: const Text("Email"),
            subtitle: Text(
              orderDetailsModel.data!.booking!.emailAdress!.toString(),
            ),
          ),
          const Divider(color: kwhiteColor),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Expanded(
                child: ListTile(
                  title: Text("VAT"),
                  subtitle: Text("Include VAT"),
                ),
              ),
              Expanded(
                child: ListTile(
                  title: Text(
                    "Total Before discount",
                    style: TextStyle(fontSize: 13),
                  ),
                  subtitle: Text("12456"),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Expanded(
                child: ListTile(
                  title: Text("discount_2"),
                  subtitle: Text("Marriage hall"),
                ),
              ),
              Expanded(
                child: ListTile(
                  title: Text("t_sum"),
                  subtitle: Text("12456"),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Expanded(
                child: ListTile(
                  title: Text("t_mam_sum"),
                  subtitle: Text("Marriage hall"),
                ),
              ),
              Expanded(
                child: ListTile(
                  title: Text("sum_total"),
                  subtitle: Text("12456"),
                ),
              ),
            ],
          ),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Consumer<CreateOrderProvider>(
                builder: (context, createOrderProvider, child) =>
                    ElevatedButton(
                  onPressed: () {
                    createOrderProvider.setedit(true);
                    createOrderProvider.editOrder(orderDetailsModel);
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const CreateOrder(),
                    ));
                  },
                  child: const Text("Edit"),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
