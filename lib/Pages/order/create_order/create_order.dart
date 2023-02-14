import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../const.dart';
import '../../events/events_page.dart';
import 'tabs/booking_tab.dart';
import 'tabs/order_tab.dart';

class CreateOrder extends StatefulWidget {
  const CreateOrder({super.key});
  @override
  State<CreateOrder> createState() => _CreateOrderState();
}

class _CreateOrderState extends State<CreateOrder>
    with TickerProviderStateMixin {
  TabController? _tabController;
  final List<Tab> myTabs = <Tab>[
    const Tab(text: "Booking Details"),
    const Tab(text: "Order Details"),
  ];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        bottomNavigationBar: Container(
          padding: const EdgeInsets.all(18),
          color: const Color(0xffF9FAFB),
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              validation();
            },
            child: const Text("Events"),
          ),
        ),
        appBar: AppBar(
          leading: const BackButton(),
          title: const Text("Create Order"),
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(18),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Booking Details",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18),
              child: ValueListenableBuilder(
                valueListenable: name,
                builder: (context, value, child) => IgnorePointer(
                  ignoring: name.text.isEmpty ? true : false,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xffE4E6EF),
                    ),
                    child: TabBar(
                      controller: _tabController,
                      unselectedLabelStyle:
                          const TextStyle(fontWeight: FontWeight.w500),
                      unselectedLabelColor: ktextColor,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: kpColor,
                      ),
                      tabs: myTabs,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _tabController,
                children: const [
                  BookingTab(),
                  OrderTab(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  var isEnemyAddedAtFive = false;
  validation() {
    if (name.text.isEmpty) {
      return Fluttertoast.showToast(msg: "Name is Empty");
    } else if (name.text.isNotEmpty && !isEnemyAddedAtFive) {
      // if (_tabController!.index == 0) {
      _tabController!.animateTo((_tabController!.index + 1));
      // }
      isEnemyAddedAtFive = true;
    } else {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const EventsPage(),
      ));
    }
  }
}
