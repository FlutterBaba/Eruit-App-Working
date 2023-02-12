import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yaqoob_test_project/const.dart';

import '../../Models/quick_select_model.dart';
import '../../api/api_service.dart';
import '../../widgets/my_drop_down.dart';
import 'widgets/bottom_button.dart';

int hall = 0;
int menu = 0;
int sever = 0;
DateTime date = DateTime.now();
DateTime todate = DateTime.now();
DateTime time = DateTime.now();
DateTime totime = DateTime.now();
TextEditingController hebdate = TextEditingController();
TextEditingController dayevent = TextEditingController();

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  APIService? apiService;

  @override
  void initState() {
    apiService = APIService();
    getHall();
    getMenu();
    getServer();
    super.initState();
  }

  List<Datum> hallList = [];
  List<Datum> menuList = [];
  List<Datum> serverList = [];

  getHall() async {
    QuickSelectModel value = await apiService!.getMainTabel(4);
    setState(() {
      hallList = value.data;
    });
    hallList.sort((a, b) => a.value.compareTo(b.value));
  }

  getMenu() async {
    QuickSelectModel value = await apiService!.getMainTabel(2);
    setState(() {
      menuList = value.data;
    });
    menuList.sort((a, b) => a.value.compareTo(b.value));
  }

  getServer() async {
    QuickSelectModel value = await apiService!.getMainTabel(9);
    setState(() {
      serverList = value.data;
    });
    serverList.sort((a, b) => a.value.compareTo(b.value));
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
    return Scaffold(
      bottomNavigationBar: const BottomButton(),
      appBar: AppBar(
        elevation: 1,
      ),
      body: hallList.isEmpty || menuList.isEmpty || serverList.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
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
                      items: hallList,
                      labelText: "Hall",
                      onChanged: (item) {
                        setState(() {
                          hall = item!.value;
                        });
                      },
                    ),
                    MyDropDown(
                      items: menuList,
                      labelText: "Menu",
                      onChanged: (item) {
                        setState(() {
                          menu = item!.value;
                        });
                      },
                    ),
                    MyDropDown(
                      items: serverList,
                      labelText: "Servers",
                      onChanged: (item) {
                        setState(() {
                          sever = item!.value;
                        });
                      },
                    ),
                    TextField(
                      readOnly: true,
                      style: const TextStyle(color: klightTextColor),
                      controller: TextEditingController(
                        text: "${date.month}-${date.day}-${date.year}",
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
                            initialDateTime: date,
                            mode: CupertinoDatePickerMode.date,
                            use24hFormat: true,
                            // This is called when the user changes the date.
                            onDateTimeChanged: (DateTime newDate) {
                              setState(() => date = newDate);
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
                              text: "${time.hour}:${time.minute}",
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
                                  initialDateTime: time,
                                  mode: CupertinoDatePickerMode.time,
                                  use24hFormat: true,

                                  // This is called when the user changes the time.
                                  onDateTimeChanged: (DateTime newTime) {
                                    setState(() => time = newTime);
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
                              text: "${totime.hour}:${totime.minute}",
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
                                  initialDateTime: totime,
                                  mode: CupertinoDatePickerMode.time,
                                  use24hFormat: true,
                                  // This is called when the user changes the time.
                                  onDateTimeChanged: (DateTime newTime) {
                                    setState(() => totime = newTime);
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
                        text: "${todate.month}-${todate.day}-${todate.year}",
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
                            initialDateTime: todate,
                            mode: CupertinoDatePickerMode.date,
                            use24hFormat: true,
                            // This is called when the user changes the date.
                            onDateTimeChanged: (DateTime newDate) {
                              setState(() => todate = newDate);
                            },
                          ),
                        );
                      },
                    ),
                    TextField(
                      controller: hebdate,
                      decoration: const InputDecoration(
                        labelText: "Hebdate",
                      ),
                    ),
                    TextField(
                      controller: dayevent,
                      decoration: const InputDecoration(
                        labelText: "Day Event",
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
