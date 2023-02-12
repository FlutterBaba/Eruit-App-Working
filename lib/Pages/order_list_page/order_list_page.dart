import 'package:flutter/material.dart';
import 'package:yaqoob_test_project/Models/get_order_model.dart';
import 'package:yaqoob_test_project/Pages/order_list_page/widgets/float_action_button.dart';
import 'package:yaqoob_test_project/Pages/order_list_page/widgets/single_order.dart';
import '../../api/api_service.dart';
import '../../const.dart';
import 'widgets/filtter_order.dart';
import 'widgets/order_app_bar.dart';

class OrderListPage extends StatefulWidget {
  const OrderListPage({super.key});
  @override
  State<OrderListPage> createState() => _OrderListPageState();
}

class _OrderListPageState extends State<OrderListPage> {
  APIService? apiService;
  @override
  void initState() {
    super.initState();
    apiService = APIService();
  }

  @override
  Widget build(BuildContext context) {
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
              const OrderAppBar(),
              const FiltterOrder(),
              Expanded(
                child: StreamBuilder<GetOrderModel>(
                  stream: apiService!.getOrders().asStream(),
                  builder: (BuildContext context,
                      AsyncSnapshot<GetOrderModel> snapshot) {
                    if (snapshot.hasData) {
                      return BuildOrder(
                        dataModel: snapshot.data!.data!.entities!,
                      );
                    }
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
  final List<Entities> dataModel;
  const BuildOrder({super.key, required this.dataModel});
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 18),
      children:
          dataModel.map((entities) => SingleOrder(entities: entities)).toList(),
    );
  }
}
