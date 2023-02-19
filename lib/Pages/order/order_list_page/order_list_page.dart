import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:yaqoob_test_project/Pages/order_filter_page/order_filter_page.dart';

import 'package:yaqoob_test_project/provider/order_provider/order_provider.dart';

import '../../../Models/get_order_model.dart';
import '../../../api/api_service.dart';
import '../../../const.dart';
import 'widgets/float_action_button.dart';
import 'widgets/single_order.dart';

Map<String, dynamic> filterOrder = {
  // "sortOrder": "desc",
  // "pageSize": 25,
};

class OrderListPage extends StatefulWidget {
  const OrderListPage({super.key});
  @override
  State<OrderListPage> createState() => _OrderListPageState();
}

class _OrderListPageState extends State<OrderListPage> {
  APIService? apiService;

  ScrollController scrollController = ScrollController();

  int pageNumber = 1;
  DateTime? selectedDate;

  String getMonth(int monthNumber) {
    late String month;
    switch (monthNumber) {
      case 1:
        month = "January";
        break;
      case 2:
        month = "February";
        break;
      case 3:
        month = "March";
        break;
      case 4:
        month = "April";
        break;
      case 5:
        month = "May";
        break;
      case 6:
        month = "June";
        break;
      case 7:
        month = "July";
        break;
      case 8:
        month = "August";
        break;
      case 9:
        month = "September";
        break;
      case 10:
        month = "October";
        break;
      case 11:
        month = "November";
        break;
      case 12:
        month = "December";
        break;
    }
    return month;
  }

  int totalCount = 1;
  Future<void> _selectDate(BuildContext context) async {
    OrderProvider orderProvider =
        Provider.of<OrderProvider>(context, listen: false);
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(
          2020,
        ),
        lastDate: DateTime(2101));
    if (picked != null) {
      orderProvider.entitiesList.clear();
      pageNumber = 1;
      selectedDate = picked;

      filterOrder = {
        "fromDate": selectedDate.toString(),
        "toDate": selectedDate.toString(),
        "pageSize": 25,
      };

      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    apiService = APIService();

    OrderProvider orderProvider =
        Provider.of<OrderProvider>(context, listen: false);
    orderProvider.getHall();
    orderProvider.getOrderStatus();
    scrollController.addListener(callBackScrollListener);
  }

  bool isLoadingMore = false;
  void callBackScrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      int pageSize = 25 + pageNumber;
      OrderProvider orderProvider =
          Provider.of<OrderProvider>(context, listen: false);

      int length = orderProvider.entitiesList.length;
      if (length != totalCount) {
        print("JKASHDJSAKHDJSKADHSJKA");
        print(length);
        print(totalCount);
        print("Dear");

        if (selectedDate != null) {
          setState(() {
            isLoadingMore = true;
            pageNumber = pageNumber + 1;
            filterOrder = {
              "pageNumber": pageNumber,
              "fromDate":
                  "${selectedDate!.year}-0${selectedDate!.month}-${selectedDate!.day}",
              "pageSize": pageSize,
              "toDate":
                  "${selectedDate!.year}-0${selectedDate!.month}-${selectedDate!.day}",
            };
          });
        } else {
          setState(() {
            isLoadingMore = true;
            pageNumber = pageNumber + 1;
            filterOrder = {
              "pageNumber": pageNumber,
              "pageSize": pageSize,
            };
          });
        }
        if (length != orderProvider.entitiesList.length) {
          setState(() {
            isLoadingMore = false;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    OrderProvider provider = Provider.of<OrderProvider>(context);
    return Scaffold(
      floatingActionButton: const FloatButton(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(backgroundImage),
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(logoSmallImagee),
                    const Text(
                      "Orders",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    CupertinoButton(
                        onPressed: () async {
                          await Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                const OrderListPageFilterPopup(),
                          ));

                          setState(() {
                            provider.entitiesList.clear();
                          });
                        },
                        child: SvgPicture.asset(filterIconSvg)),
                  ],
                ),
              ),
              CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () async {
                  await _selectDate(context);

                  setState(() {});
                },
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.4),
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(selectedDate == null
                          ? "Select"
                          : "${selectedDate!.day} ${getMonth(selectedDate!.month)} ${selectedDate!.year}"),
                      const Icon(Icons.arrow_drop_down_sharp)
                    ],
                  ),
                ),
              ),
              Expanded(
                child: StreamBuilder(
                  stream: provider.getOrders(jsonValue: filterOrder).asStream(),
                  builder: (BuildContext context,
                      AsyncSnapshot<dartz.Either<GetOrderModel, String>>
                          snapshot) {
                    if (snapshot.hasData) {
                      return snapshot.data!.fold((l) {
                        provider.entitiesList = [...l.data!.entities!];
                        // if (provider.entitiesList.length !=
                        //     l.data!.entities!.length) {
                        //   //     print(provider.entitiesList.length);
                        //   // provider.entitiesList.addAll(l.data!.entities!);
                        // }
                        // provider.entitiesList.addAll(l.data!.entities!);
                        totalCount = l.data!.totalCount!;
                        return BuildOrder(
                          list: provider.entitiesList,
                          isLoading: isLoadingMore,
                          controller: scrollController,
                        );
                      }, (r) {
                        return Center(
                            child: Text(
                          r,
                          style: const TextStyle(
                            fontSize: 24,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ));
                      });
                    }
                    // if()
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BuildOrder extends StatefulWidget {
  final ScrollController controller;
  final List<Entities> list;
  final bool isLoading;
  const BuildOrder(
      {super.key,
      required this.controller,
      required this.isLoading,
      required this.list});

  @override
  State<BuildOrder> createState() => _BuildOrderState();
}

class _BuildOrderState extends State<BuildOrder> {
  @override
  void initState() {
    print("Hello");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: widget.controller,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 18),
      itemCount: widget.isLoading ? widget.list.length + 1 : widget.list.length,
      itemBuilder: (context, index) {
        if (index < widget.list.length) {
          // print(provider.entitiesList[index].fromDate);
          return SingleOrder(entities: widget.list[index]);
        } else {
          return const Padding(
            padding: EdgeInsets.only(top: 12.0),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
      // children: provider.entitiesList
      //     .map((entities) => SingleOrder(entities: entities))
      //     .toList(),
    );
  }
}
