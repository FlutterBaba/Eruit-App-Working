import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:yaqoob_test_project/provider/order_provider/create_order_provider.dart';
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
  CreateOrderProvider? _appProvider;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void didChangeDependencies() {
    _appProvider = Provider.of<CreateOrderProvider>(context, listen: false);
    // _appProvider!.name = "";
    // _appProvider!.address1 = "";
    // _appProvider!.telephone1 = "";
    // _appProvider!.email = "";
    // _appProvider!.name = "";
    // _appProvider!.phone = "";
    // // order details
    // _appProvider!.terms = null;
    // _appProvider!.orderStatus = "";
    // _appProvider!.agents = null;
    // _appProvider!.eventLocation = "";
    // _appProvider!.events = null;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _appProvider!.name = "";
    _appProvider!.address1 = "";
    _appProvider!.telephone1 = "";
    _appProvider!.email = "";
    _appProvider!.name = "";
    _appProvider!.phone = "";
    // order details
    _appProvider!.terms = null;
    _appProvider!.orderStatus = "";
    _appProvider!.agents = null;
    _appProvider!.eventLocation = "";
    _appProvider!.events = null;
    _tabController!.dispose();
    _appProvider!.toDate = null;
    _appProvider!.formDate = null;
    _appProvider!.fromTime = null;
    _appProvider!.toTime = null;

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
          child: Consumer<CreateOrderProvider>(
            builder: (context, createOrderProvider, child) => ElevatedButton(
              onPressed: () {
                if (createOrderProvider.name!.isEmpty) {
                  Fluttertoast.showToast(msg: "Name is Empty");
                } else if (_tabController!.index == 0) {
                  _tabController!.animateTo((_tabController!.index + 1));
                  return;
                } else {
                  if (createOrderProvider.terms == null) {
                    Fluttertoast.showToast(msg: "Terms is Empty");
                  } else if (createOrderProvider.orderStatus!.isEmpty) {
                    Fluttertoast.showToast(msg: "Order Status is Empty");
                  } else if (createOrderProvider.agents == null) {
                    Fluttertoast.showToast(msg: "Agents is Empty");
                  } else if (createOrderProvider.events == null) {
                    Fluttertoast.showToast(msg: "Events is Empty");
                  } else {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const EventsPage(),
                    ));

                    // print(createOrderProvider.terms.toString());
                    // print(createOrderProvider.orderStatus.toString());
                    // print(createOrderProvider.agents.toString());
                    // print(createOrderProvider.events.toString());
                  }
                }
              },
              child: const Text("Events"),
            ),
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
              child: Consumer<CreateOrderProvider>(
                builder: (context, createOrderProvider, child) => IgnorePointer(
                  ignoring: createOrderProvider.name!.isEmpty ? true : false,
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
}
