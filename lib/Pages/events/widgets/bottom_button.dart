import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:yaqoob_test_project/Models/save_order_model.dart';
import 'package:yaqoob_test_project/Pages/order/create_order/tabs/booking_tab.dart';
import 'package:yaqoob_test_project/Pages/order/create_order/tabs/order_tab.dart';
import 'package:yaqoob_test_project/Pages/events/events_page.dart';
import 'package:yaqoob_test_project/Pages/order/order_list_page/order_list_page.dart';
import 'package:yaqoob_test_project/api/api_service.dart';
import 'package:yaqoob_test_project/const.dart';

class BottomButton extends StatefulWidget {
  const BottomButton({super.key});
  @override
  State<BottomButton> createState() => _BottomButtonState();
}

class _BottomButtonState extends State<BottomButton> {
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      color: const Color(0xffF9FAFB),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  APIService apiService = APIService();
                  setState(() {
                    isloading = true;
                  });
                  apiService
                      .saveOrder(
                    SaveOrderModel(
                      status: orderstatus,
                      agent: agents,
                      eventLocation: eventLocation.text,
                      event: events,
                      events: [
                        Event(
                          editEventFlag: true,
                          hall: hall + 1,
                          menu: menu + 1,
                          server: sever + 1,
                          toDate:
                              "${todate.month}-${todate.day}-${todate.year}",
                          fromDate: "${date.month}-${date.day}-${date.year}",
                          fromTime: "${time.hour}:${time.minute}",
                          toTime: "${totime.hour}:${totime.minute}",
                        ),
                      ],
                      booking: Booking(
                        name: name.text,
                        address1: address1.text,
                        telefon1: telephone1.text,
                        emailAdress: email.text,
                        number: phone.text,
                        picture: "",
                        terms: terms,
                      ),
                    ),
                  )
                      .then(
                    (value) {
                      setState(() {
                        isloading = false;
                      });
                      Fluttertoast.showToast(
                        msg: value.messages![0].toString(),
                      );
                      if (value.data != null) {
                        print(value.data);
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const OrderListPage(),
                        ));
                      }
                    },
                  );
                },
                child: isloading
                    ? const CircularProgressIndicator(color: kwhiteColor)
                    : const Text("Save"),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
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
    );
  }
}
