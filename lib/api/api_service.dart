import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:yaqoob_test_project/Models/order_details_model.dart';
import 'package:yaqoob_test_project/Models/quick_select_model.dart';
import 'package:yaqoob_test_project/Models/save_order_model.dart';
import 'package:yaqoob_test_project/shared_service.dart';
import '../Models/login_model.dart';

class APIService {
  final String _baseUrl = "http://54.74.47.46:82";
  // •	Get Order list :

  //•	Get Order Details by Order Number  :
// 124029
  Future<OrderDetailsModel> orderDetails(order) async {
    String? token = await SharedService.getToken();
    String url = "$_baseUrl/OrderMob/GetOrderMobDetailsById?id=$order";
    final response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        "Content-Type": "application/json; charset=utf-8",
        "Authorization": "Bearer $token",
      },
    );
    if (response.statusCode == 200 || response.statusCode == 400) {
      return OrderDetailsModel.fromJson(
        json.decode(response.body.toString()),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }

//  Get login
  Future<LoginResponseModel> login({
    required String username,
    required String password,
    required String firmname,
  }) async {
    final response = await http.post(
        Uri.parse("http://54.74.47.46:82/Account/Login?firmName=$firmname"),
        headers: <String, String>{
          "Content-Type": "application/json; charset=utf-8",
        },
        body: jsonEncode(
          <dynamic, dynamic>{"userName": username, "password": password},
        ));
    if (response.statusCode == 200 || response.statusCode == 400) {
      print(response.body);
      return LoginResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data!');
    }
  }

  // •	Get Main Table By first Number

  Future<QuickSelectModel> getMainTabel(number) async {
    String? token = await SharedService.getToken();
    final response = await http.get(
        Uri.parse(
            "$_baseUrl/QuickSelect/GetMainByfirst_number?first_number=$number"),
        headers: <String, String>{
          "Content-Type": "application/json; charset=utf-8",
          "Authorization": "Bearer $token",
        });
    if (response.statusCode == 200 || response.statusCode == 400) {
      return QuickSelectModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data!');
    }
  }

  /// 	•	Get Order Status list
  Future<QuickSelectModel> getOrderStatus() async {
    String? token = await SharedService.getToken();
    final response = await http.get(
        Uri.parse("$_baseUrl/QuickSelect/GetOrderStatus"),
        headers: <String, String>{
          "Content-Type": "application/json; charset=utf-8",
          "Authorization": "Bearer $token",
        });
    if (response.statusCode == 200 || response.statusCode == 400) {
      return QuickSelectModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data!');
    }
  }

  /// 	•	Save Order Data API :

  Future<SaveOrderResponseModel> saveOrder(
      SaveOrderModel saveOrderModel) async {
    String? token = await SharedService.getToken();
    final response =
        await http.post(Uri.parse("$_baseUrl/OrderMob/SaveOrderData"),
            headers: <String, String>{
              "Content-Type": "application/json; charset=utf-8",
              "Authorization": "Bearer $token",
            },
            body: jsonEncode(
              saveOrderModel.toJson(),
            ));
    if (response.statusCode == 200 || response.statusCode == 400) {
      return SaveOrderResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data!');
    }
  }
}
