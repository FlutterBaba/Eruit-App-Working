import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:yaqoob_test_project/const.dart';
import 'package:yaqoob_test_project/provider/order_provider/create_order_provider.dart';
import '../../api/api_service.dart';
import '../../provider/order_provider/order_provider.dart';
import '../../widgets/my_drop_down.dart';
import 'widgets/bottom_button.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  APIService? apiService;
  TextEditingController hebdate = TextEditingController();
  TextEditingController dayevent = TextEditingController();

  @override
  void initState() {
    apiService = APIService();
    super.initState();
  }

  @override
  void dispose() {
    hebdate.dispose();
    dayevent.dispose();
    super.dispose();
  }

  CreateOrderProvider? _appProvider;

  @override
  void didChangeDependencies() {
    _appProvider = Provider.of<CreateOrderProvider>(context, listen: false);
    _appProvider!.hall = null;
    _appProvider!.menu = null;
    _appProvider!.servers = null;
    super.didChangeDependencies();
  }

  // This function displays a CupertinoModalPopup with a reasonable fixed height
  // which hosts CupertinoDatePicker.
  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        // The Bottom margin is provided to align the popup above the system
        // navigation bar.
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        // Provide a background color for the popup.
        color: CupertinoColors.systemBackground.resolveFrom(context),
        // Use a SafeArea widget to avoid system overlaps.
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    OrderProvider orderProvider = Provider.of<OrderProvider>(context);
    return Scaffold(
      bottomNavigationBar: const BottomButton(),
      appBar: AppBar(
        elevation: 1,
      ),
      body: orderProvider.getHallList.isEmpty ||
              orderProvider.getHallList.isEmpty ||
              orderProvider.getHallList.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Consumer<CreateOrderProvider>(
              builder: (context, createOrderProvider, child) =>
                  SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: OverflowBar(
                    overflowSpacing: 20,
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: const Text(
                          "Events",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: SizedBox(
                          width: 100,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text("Items"),
                          ),
                        ),
                      ),
                      MyDropDown(
                        items: orderProvider.getHallList,
                        labelText: "Hall",
                        onChanged: createOrderProvider.setHall,
                      ),
                      MyDropDown(
                        items: orderProvider.getMenuList,
                        labelText: "Menu",
                        onChanged: createOrderProvider.setMenu,
                      ),
                      MyDropDown(
                        items: orderProvider.getServerList,
                        labelText: "Servers",
                        onChanged: createOrderProvider.setServers,
                      ),
                      TextField(
                        readOnly: true,
                        style: const TextStyle(color: klightTextColor),
                        controller: TextEditingController(
                          text: createOrderProvider.formDate == null
                              ? null
                              : "${createOrderProvider.formDate!.month}-${createOrderProvider.formDate!.day}-${createOrderProvider.formDate!.year}",
                        ),
                        decoration: const InputDecoration(
                          labelText: "From Date",
                          suffixIcon: Icon(Icons.date_range),
                          hintStyle: TextStyle(
                            color: klightTextColor,
                          ),
                        ),
                        onTap: () {
                          _showDialog(
                            CupertinoDatePicker(
                              initialDateTime: createOrderProvider.formDate,
                              mode: CupertinoDatePickerMode.date,
                              use24hFormat: true,
                              // This is called when the user changes the date.
                              onDateTimeChanged: (DateTime newDate) {
                                setState(
                                  () {
                                    createOrderProvider.formDate = newDate;
                                    apiService!
                                        .getHebdateDayEventByDate(
                                            "${createOrderProvider.formDate!.month}-${createOrderProvider.formDate!.day}-${createOrderProvider.formDate!.year}")
                                        .then(
                                      (value) {
                                        if (value.requestResponse == false) {
                                          Fluttertoast.showToast(
                                              msg: value.messages![0]);
                                        } else {
                                          hebdate.text =
                                              value.data!.hebdate.toString();
                                          dayevent.text =
                                              value.data!.dayEvent.toString();
                                        }
                                      },
                                    );
                                  },
                                );
                              },
                            ),
                          );
                        },
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              readOnly: true,
                              style: const TextStyle(color: klightTextColor),
                              controller: TextEditingController(
                                text: createOrderProvider.fromTime == null
                                    ? null
                                    : "${createOrderProvider.fromTime!.hour}:${createOrderProvider.fromTime!.minute}",
                              ),
                              decoration: const InputDecoration(
                                labelText: "From Time",
                                suffixIcon: Icon(Icons.access_time_outlined),
                                hintStyle: TextStyle(
                                  color: klightTextColor,
                                ),
                              ),
                              onTap: () {
                                _showDialog(
                                  CupertinoDatePicker(
                                    initialDateTime:
                                        createOrderProvider.fromTime,
                                    mode: CupertinoDatePickerMode.time,
                                    use24hFormat: true,

                                    // This is called when the user changes the time.
                                    onDateTimeChanged: (DateTime newTime) {
                                      setState(() => createOrderProvider
                                          .fromTime = newTime);
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: TextField(
                              readOnly: true,
                              style: const TextStyle(color: klightTextColor),
                              controller: TextEditingController(
                                text: createOrderProvider.toTime == null
                                    ? null
                                    : "${createOrderProvider.toTime!.hour}:${createOrderProvider.toTime!.minute}",
                              ),
                              decoration: const InputDecoration(
                                labelText: "To Time",
                                suffixIcon: Icon(Icons.access_time_outlined),
                                hintStyle: TextStyle(
                                  color: klightTextColor,
                                ),
                              ),
                              onTap: () {
                                _showDialog(
                                  CupertinoDatePicker(
                                    initialDateTime: createOrderProvider.toTime,
                                    mode: CupertinoDatePickerMode.time,
                                    use24hFormat: true,
                                    // This is called when the user changes the time.
                                    onDateTimeChanged: (DateTime newTime) {
                                      setState(() =>
                                          createOrderProvider.toTime = newTime);
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      TextField(
                        readOnly: true,
                        style: const TextStyle(color: klightTextColor),
                        controller: TextEditingController(
                          text: createOrderProvider.toDate == null
                              ? null
                              : "${createOrderProvider.toDate!.month}-${createOrderProvider.toDate!.day}-${createOrderProvider.toDate!.year}",
                        ),
                        decoration: const InputDecoration(
                          labelText: "To Date",
                          suffixIcon: Icon(Icons.date_range),
                          hintStyle: TextStyle(
                            color: klightTextColor,
                          ),
                        ),
                        onTap: () {
                          _showDialog(
                            CupertinoDatePicker(
                              initialDateTime: createOrderProvider.toDate,
                              mode: CupertinoDatePickerMode.date,
                              use24hFormat: true,
                              // This is called when the user changes the date.
                              onDateTimeChanged: (DateTime newDate) {
                                setState(
                                  () => createOrderProvider.toDate = newDate,
                                );
                              },
                            ),
                          );
                        },
                      ),
                      TextField(
                        onChanged: createOrderProvider.setHebDate,
                        style: const TextStyle(color: klightTextColor),
                        controller: hebdate,
                        decoration: const InputDecoration(
                          labelText: "Hebdate",
                        ),
                      ),
                      TextField(
                        onChanged: createOrderProvider.setDayEvent,
                        style: const TextStyle(color: klightTextColor),
                        controller: dayevent,
                        decoration: const InputDecoration(
                          labelText: "Day Event",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
