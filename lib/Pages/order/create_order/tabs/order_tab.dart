import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:yaqoob_test_project/api/api_service.dart';
import 'package:yaqoob_test_project/provider/order_provider/create_order_provider.dart';
import '../../../../const.dart';
import '../../../../provider/order_provider/order_provider.dart';
import '../../../../widgets/my_drop_down.dart';

class OrderTab extends StatefulWidget {
  const OrderTab({super.key});

  @override
  State<OrderTab> createState() => _OrderTabState();
}

class _OrderTabState extends State<OrderTab> {
  APIService? apiService;
  var orderDate = DateFormat.yMd().add_jm().format(DateTime.now());
  TextEditingController eventLocation = TextEditingController();
  @override
  void initState() {
    apiService = APIService();

    super.initState();
  }

  @override
  void dispose() {
    eventLocation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    OrderProvider orderProvider = Provider.of<OrderProvider>(context);
    // CreateOrderProvider createOrderProvider =
    //     Provider.of<CreateOrderProvider>(context);

    // int terms = orderProvider.getTermsList
    //     .indexWhere((element) => element.value == createOrderProvider.terms);

    // int orderStatus = orderProvider.getOrderStatusList.indexWhere(
    //     (element) => element.value == createOrderProvider.orderStatus);

    // int agents = orderProvider.getAgentsList
    //     .indexWhere((element) => element.value == createOrderProvider.agents);

    // createOrderProvider.eventLocation != null
    //     ? eventLocation.text = createOrderProvider.eventLocation!
    //     : null;

    // int events = orderProvider.getEventsList
    //     .indexWhere((element) => element.value == createOrderProvider.events);

    return orderProvider.getTermsList.isEmpty ||
            orderProvider.getOrderStatusList.isEmpty ||
            orderProvider.getAgentsList.isEmpty ||
            orderProvider.getEventsList.isEmpty
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: OverflowBar(
                overflowSpacing: 20,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "Order Date",
                        style: TextStyle(color: klightTextColor),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          const Icon(Icons.date_range_outlined),
                          const SizedBox(width: 5),
                          Text(
                            orderDate,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Consumer<CreateOrderProvider>(
                    builder: (context, createOrderProvider, child) =>
                        OverflowBar(
                      overflowSpacing: 20,
                      children: [
                        MyDropDown(
                          items: orderProvider.getTermsList,
                          labelText: "Terms",
                          onChanged: createOrderProvider.setTems,
                        ),
                        MyDropDown(
                          items: orderProvider.getOrderStatusList,
                          labelText: "Order Status",
                          onChanged: createOrderProvider.setOrderStatus,
                        ),
                        MyDropDown(
                          items: orderProvider.getAgentsList,
                          labelText: "Agents",
                          onChanged: createOrderProvider.setAgent,
                        ),
                        TextField(
                          onChanged: createOrderProvider.setEventLocation,
                          controller: eventLocation,
                          style: const TextStyle(color: klightTextColor),
                          decoration: const InputDecoration(
                            labelText: "Event Location",
                          ),
                        ),
                        MyDropDown(
                          items: orderProvider.getEventsList,
                          labelText: "Events",
                          onChanged: createOrderProvider.setEvents,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
