import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:yaqoob_test_project/Pages/order_filter_page/order_filter_page.dart';
import 'package:yaqoob_test_project/Pages/order_list_page/widgets/float_action_button.dart';
import 'package:yaqoob_test_project/Pages/order_list_page/widgets/single_order.dart';
import 'package:yaqoob_test_project/provider/order_provider/order_provider.dart';
import '../../Models/get_order_model.dart';
import '../../api/api_service.dart';
import '../../const.dart';
import 'widgets/filtter_order.dart';

Map<String, dynamic> filterOrder = {
  // "sortOrder": "desc",
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
      OrderProvider orderProvider =
          Provider.of<OrderProvider>(context, listen: false);
      int length = orderProvider.entitiesList.length;
      setState(() {
        isLoadingMore = true;
        pageNumber = pageNumber + 1;
        filterOrder = {
          "sortOrder": "desc",
          "pageNumber": pageNumber,
        };
      });
      if (length != orderProvider.entitiesList.length) {
        setState(() {
          isLoadingMore = false;
        });
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
                          provider.entitiesList.clear();
                          setState(() {});
                        },
                        child: SvgPicture.asset(filterIconSvg)),
                  ],
                ),
              ),
              const FiltterOrder(),
              Expanded(
                child: StreamBuilder(
                  stream: provider.getOrders(jsonValue: filterOrder).asStream(),
                  builder: (BuildContext context,
                      AsyncSnapshot<dartz.Either<List<Entities>, String>>
                          snapshot) {
                    if (snapshot.hasData) {
                      return snapshot.data!.fold((l) {
                        return BuildOrder(
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

class BuildOrder extends StatelessWidget {
  final ScrollController controller;
  final bool isLoading;
  const BuildOrder(
      {super.key, required this.controller, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    OrderProvider provider = Provider.of<OrderProvider>(context);

    return ListView.builder(
      controller: controller,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 18),
      itemCount: isLoading
          ? provider.entitiesList.length + 1
          : provider.entitiesList.length,
      itemBuilder: (context, index) {
        if (index < provider.entitiesList.length) {
          return SingleOrder(entities: provider.entitiesList[index]);
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
