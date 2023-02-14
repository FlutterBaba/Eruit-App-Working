import 'package:flutter/material.dart';
import 'package:yaqoob_test_project/Models/order_details_model.dart';
import '../../../api/api_service.dart';
import '../../../const.dart';
import 'widgets/details.dart';
import 'widgets/order_details_events.dart';

class OrderDetailsPage extends StatefulWidget {
  final int order;
  const OrderDetailsPage({super.key, required this.order});
  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  APIService? apiService;
  @override
  void initState() {
    super.initState();
    apiService = APIService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(backgroundImage),
          ),
        ),
        child: SafeArea(
          child: StreamBuilder<OrderDetailsModel>(
            stream: apiService!.orderDetails(widget.order).asStream(),
            builder: (BuildContext context,
                AsyncSnapshot<OrderDetailsModel> snapshot) {
              if (snapshot.hasData) {
                return BuildOrderDetails(orderDetailsModel: snapshot.data!);
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}

class BuildOrderDetails extends StatelessWidget {
  final OrderDetailsModel orderDetailsModel;
  const BuildOrderDetails({super.key, required this.orderDetailsModel});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          backgroundColor: Colors.transparent,
          title: const Text("Order"),
        ),
        Expanded(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Details(orderDetailsModel: orderDetailsModel),
              const ListTile(
                leading: Text(
                  "Events",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              OrderDetailsEvents(orderDetailsModel: orderDetailsModel),
            ],
          ),
        ),
      ],
    );
  }
}
