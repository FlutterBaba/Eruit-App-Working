import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:yaqoob_test_project/const.dart';
import 'package:yaqoob_test_project/provider/order_provider/create_order_provider.dart';

import '../../../Models/save_order_model.dart';
import '../../../api/api_service.dart';
import '../../order/order_list_page/order_list_page.dart';

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
              child: Consumer<CreateOrderProvider>(
                builder: (context, createOrderProvider, child) =>
                    ElevatedButton(
                  onPressed: () {
                    if (createOrderProvider.hall == null) {
                      Fluttertoast.showToast(msg: "Hall Is empty");
                    } else if (createOrderProvider.menu == null) {
                      Fluttertoast.showToast(msg: "Menu Is empty");
                    } else if (createOrderProvider.servers == null) {
                      Fluttertoast.showToast(msg: "Servers Is empty");
                    } else if (createOrderProvider.formDate == null) {
                      Fluttertoast.showToast(msg: "formDate Is empty");
                    } else if (createOrderProvider.fromTime == null) {
                      Fluttertoast.showToast(msg: "from Time Is empty");
                    } else if (createOrderProvider.toTime == null) {
                      Fluttertoast.showToast(msg: "to Time Is empty");
                    } else if (createOrderProvider.toDate == null) {
                      Fluttertoast.showToast(msg: "to Date Is empty");
                    } else {
                      APIService apiService = APIService();
                      setState(() {
                        isloading = true;
                      });

                      apiService
                          .saveOrder(
                        SaveOrderModel(
                          status: createOrderProvider.orderStatus,
                          agent: createOrderProvider.agents,
                          eventLocation: createOrderProvider.eventLocation,
                          event: createOrderProvider.events,
                          events: [
                            Event(
                              editEventFlag: true,
                              hall: createOrderProvider.hall,
                              menu: createOrderProvider.menu,
                              server: createOrderProvider.servers,
                              fromDate: createOrderProvider.formDate.toString(),
                              toDate: createOrderProvider.toDate.toString(),
                              fromTime:
                                  "${createOrderProvider.fromTime!.hour}:${createOrderProvider.fromTime!.minute}",
                              toTime:
                                  "${createOrderProvider.toTime!.hour}:${createOrderProvider.toTime!.minute}",
                            ),
                          ],
                          booking: Booking(
                            name: createOrderProvider.name,
                            address1: createOrderProvider.address1,
                            telefon1: createOrderProvider.telephone1,
                            emailAdress: createOrderProvider.email,
                            number: createOrderProvider.phone,
                            picture: "",
                            terms: createOrderProvider.terms,
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
                    }
                  },
                  child: isloading
                      ? const CircularProgressIndicator(color: kwhiteColor)
                      : const Text("Save"),
                ),
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
