import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:yaqoob_test_project/shared_service.dart';

import '../../Models/get_order_model.dart';
import '../../Models/quick_select_model.dart';
import '../../api/api_service.dart';
import 'package:http/http.dart' as http;

import '../../constants/constants.dart';

class OrderProvider with ChangeNotifier {
  // Create order booking details fields controllers//

  List<Datum> _orderstatusList = [];
  final APIService _apiService = APIService();

  void getOrderStatus() async {
    QuickSelectModel value = await _apiService.getOrderStatus();
    _orderstatusList = value.data;
    _orderstatusList.sort((a, b) => a.value.compareTo(b.value));
  }

  List<Datum> _hallList = [];

  void getHall() async {
    QuickSelectModel value = await _apiService.getMainTabel(4);
    _hallList = value.data;
    _hallList.sort((a, b) => a.value.compareTo(b.value));
  }

  List<Datum> get getHallList => _hallList;
  List<Datum> get getOrderStatusList => _orderstatusList;

  //// Get OrderPageList /// / / / // / / / / / / // / / / / / / / // / / / / / / / /

  List<Entities> entitiesList = [];

  Future<Either<GetOrderModel, String>> getOrders(
      {required Map<String, dynamic> jsonValue}) async {
    String? token = await SharedService.getToken();
    String url = "$baseUrl/Order/GetOrders";
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          "Content-Type": "application/json; charset=utf-8",
          "Authorization": "Bearer $token",
        },
        body: jsonEncode(jsonValue),
      );

      if (response.statusCode == 200 || response.statusCode == 400) {
        var value = json.decode(response.body);

        if (value["Data"]["totalCount"] == 0) {
          return const Right("No Data Found");
        } else {
          GetOrderModel getOrderModel = GetOrderModel.fromJson(value);
          return Left(getOrderModel);
        }
      } else {
        return const Right("Something Went Wrong");
      }
    } catch (e) {
      return const Right("Something Went Wrong");
    }
  }
}
