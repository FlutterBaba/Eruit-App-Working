import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:yaqoob_test_project/Models/quick_select_model.dart';
import 'package:yaqoob_test_project/api/api_service.dart';
import 'package:yaqoob_test_project/provider/order_provider/order_provider.dart';
import '../../../const.dart';
import '../../../widgets/my_drop_down.dart';

int terms = 0;
String? orderstatus;
int agents = 0;
int events = 0;
TextEditingController eventLocation = TextEditingController();
var orderDate = DateFormat.yMd().add_jm().format(DateTime.now());

class OrderTab extends StatefulWidget {
  const OrderTab({super.key});

  @override
  State<OrderTab> createState() => _OrderTabState();
}

class _OrderTabState extends State<OrderTab> {
  APIService? apiService;
  List<Datum> termsList = [];
  List<Datum> agentsList = [];
  List<Datum> eventsList = [];

  @override
  void initState() {
    apiService = APIService();
    getTerms();
    getAgents();
    getEvvents();
    super.initState();
  }

  getTerms() async {
    QuickSelectModel value = await apiService!.getMainTabel(33);
    setState(() {
      termsList = value.data;
    });
    termsList.sort((a, b) => a.value.compareTo(b.value));
  }

  getAgents() async {
    QuickSelectModel value = await apiService!.getMainTabel(31);
    setState(() {
      agentsList = value.data;
    });
    agentsList.sort((a, b) => a.value.compareTo(b.value));
  }

  getEvvents() async {
    QuickSelectModel value = await apiService!.getMainTabel(7);
    setState(() {
      eventsList = value.data;
    });
    eventsList.sort((a, b) => a.value.compareTo(b.value));
  }

  @override
  Widget build(BuildContext context) {
    OrderProvider orderProvider = Provider.of<OrderProvider>(context);
    return termsList.isEmpty ||
            orderProvider.getOrderStatusList.isEmpty ||
            agentsList.isEmpty ||
            eventsList.isEmpty
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
                  MyDropDown(
                    items: termsList,
                    labelText: "Terms",
                    onChanged: (item) {
                      setState(() {
                        terms = item!.value;
                      });
                    },
                  ),
                  MyDropDown(
                    items: orderProvider.getOrderStatusList,
                    labelText: "Order Status",
                    onChanged: (item) {
                      setState(() {
                        orderstatus = item!.text;
                      });
                    },
                  ),
                  MyDropDown(
                    items: agentsList,
                    labelText: "Agents",
                    onChanged: (item) {
                      setState(() {
                        agents = item!.value;
                      });
                    },
                  ),
                  TextField(
                    controller: eventLocation,
                    style: const TextStyle(color: klightTextColor),
                    decoration:
                        const InputDecoration(labelText: "Event Location"),
                  ),
                  MyDropDown(
                    items: eventsList,
                    labelText: "Events",
                    onChanged: (item) {
                      setState(() {
                        events = item!.value;
                      });
                    },
                  ),
                ],
              ),
            ),
          );
  }
}
