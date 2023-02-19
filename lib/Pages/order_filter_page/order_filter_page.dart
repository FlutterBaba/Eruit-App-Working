import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:yaqoob_test_project/provider/order_provider/order_provider.dart';

import '../../../Models/quick_select_model.dart';
import '../../../const.dart';
import '../../../widgets/my_drop_down.dart';
import '../order/order_list_page/order_list_page.dart';

enum SingingCharacter { eventdate, orderdate, lastupdate }

class OrderListPageFilterPopup extends StatefulWidget {
  const OrderListPageFilterPopup({super.key});

  @override
  State<OrderListPageFilterPopup> createState() =>
      _OrderListPageFilterPopupState();
}

class _OrderListPageFilterPopupState extends State<OrderListPageFilterPopup> {
  SingingCharacter _character = SingingCharacter.eventdate;
  DateTimeRange? _dateRange;
  List<String> monthList = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];

  TextEditingController fromOrder = TextEditingController();
  TextEditingController toOrder = TextEditingController();
  TextEditingController fromTotal = TextEditingController();
  TextEditingController toTotal = TextEditingController();

  int? hallValue;

  String? orderStatusValue;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    OrderProvider orderProvider = Provider.of<OrderProvider>(context);
    return Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(15),
        color: const Color(0xffF9FAFB),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      filterOrder = <String, dynamic>{
                        "fromDoc":
                            fromOrder.text.isEmpty ? null : fromOrder.text,
                        "toDoc": toOrder.text.isEmpty ? null : toOrder.text,
                        "fromDate": _dateRange == null
                            ? null
                            : _dateRange!.start.toString(),
                        "toDate": _dateRange == null
                            ? null
                            : _dateRange!.end.toString(),
                        "fromTotal":
                            fromTotal.text.isEmpty ? null : fromTotal.text,
                        "toTotal": toTotal.text.isEmpty ? null : toTotal.text,
                        "halls": hallValue,
                        "statuses": orderStatusValue,
                      };
                    });
                    Navigator.of(context).pop();
                  },
                  child: const Text("Apply"),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    fromOrder.clear();
                    toOrder.clear();
                    _dateRange = null;
                    fromTotal.clear();
                    toTotal.clear();
                    hallValue = null;
                    orderStatusValue = null;
                    _character = SingingCharacter.eventdate;
                    setState(() {});
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(color: Colors.black),
                    ),
                    elevation: 0,
                    backgroundColor: const Color(0xffF9FAFB),
                  ),
                  child: const Text(
                    "Clear",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text("Order Filter"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: ListView(
          children: [
            const Text("Doc"),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    controller: fromOrder,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: "From Order"),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: toOrder,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: const InputDecoration(labelText: "To Order"),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text("Date"),
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: _dateRange == null
                    ? "From Date - To Date"
                    : "${monthList[_dateRange!.start.month - 1]} ${_dateRange!.start.day} - ${monthList[_dateRange!.end.month - 1]} ${_dateRange!.end.day} ",
                suffixIcon: IconButton(
                  icon: const Icon(Icons.date_range_rounded),
                  onPressed: () {
                    _showDateRangePicker();
                  },
                ),
              ),
            ),
            const SizedBox(height: 10),
            const SizedBox(height: 12),
            const Text("Order total"),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: fromTotal,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: const InputDecoration(labelText: "From Total"),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: toTotal,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: const InputDecoration(labelText: "To Total"),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text("Hall"),
            const SizedBox(height: 10),
            MyDropDown(
              items: orderProvider.getHallList,
              labelText: "",
              onChanged: (item) {
                setState(() {
                  hallValue = item!.value;
                });
              },
            ),
            const SizedBox(height: 10),
            const Text("Status"),
            const SizedBox(height: 10),
            MyDropDown(
              items: orderProvider.getOrderStatusList,
              labelText: "",
              onChanged: (Datum? item) {
                setState(() {
                  orderStatusValue = item!.value;
                });
              },
            ),
            const SizedBox(height: 10),
            const Text("Date filter type"),
            const SizedBox(height: 10),
            Row(
              children: <Widget>[
                Expanded(
                  child: RadioListTile<SingingCharacter>(
                    contentPadding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        color: _character == SingingCharacter.eventdate
                            ? kpColor
                            : kborderColor,
                      ),
                    ),
                    title: const Text(
                      'Event\nDate',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    value: SingingCharacter.eventdate,
                    groupValue: _character,
                    onChanged: (SingingCharacter? value) {
                      setState(() {
                        _character = value!;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: RadioListTile<SingingCharacter>(
                    contentPadding: EdgeInsets.zero,
                    title: const Text(
                      'Order\nDate',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        color: _character == SingingCharacter.orderdate
                            ? kpColor
                            : kborderColor,
                      ),
                    ),
                    value: SingingCharacter.orderdate,
                    groupValue: _character,
                    onChanged: (SingingCharacter? value) {
                      setState(() {
                        _character = value!;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: RadioListTile<SingingCharacter>(
                    contentPadding: EdgeInsets.zero,
                    title: const Text(
                      'Last\nOrder',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        color: _character == SingingCharacter.lastupdate
                            ? kpColor
                            : kborderColor,
                      ),
                    ),
                    value: SingingCharacter.lastupdate,
                    groupValue: _character,
                    onChanged: (SingingCharacter? value) {
                      setState(() {
                        _character = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showDateRangePicker() async {
    final DateTimeRange? result = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2022, 1, 1),
      lastDate: DateTime(2030, 12, 31),
      currentDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: kpColor,
            buttonTheme:
                const ButtonThemeData(textTheme: ButtonTextTheme.primary),
            colorScheme: const ColorScheme.light(primary: kpColor)
                .copyWith(secondary: kpColor),
          ),
          child: child!,
        );
      },
      cancelText: "Cancel",
      saveText: 'Done',
    );

    if (result != null) {
      setState(() {
        _dateRange = result;
      });
    }
  }
}
