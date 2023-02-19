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
  final String _baseUrl = "http://54.74.47.46:82";

  List<Datum> _orderstatusList = [];
  final APIService _apiService = APIService();
  List<Datum> _menuList = [];
  List<Datum> _serverList = [];
  List<Datum> _termsList = [];
  List<Datum> _agentsList = [];
  List<Datum> _eventsList = [];
  List<Datum> _hallList = [];

  void getOrderStatus() async {
    QuickSelectModel value = await _apiService.getOrderStatus();
    _orderstatusList = value.data;
    _orderstatusList.sort((a, b) => a.value.compareTo(b.value));
  }

  void getHall() async {
    QuickSelectModel value = await _apiService.getMainTabel(4);
    _hallList = value.data;
    _hallList.sort((a, b) => a.value.compareTo(b.value));
  }

  getMenu() async {
    QuickSelectModel value = await _apiService.getMainTabel(2);
    _menuList = value.data;
    _menuList.sort((a, b) => a.value.compareTo(b.value));
  }

  getServer() async {
    QuickSelectModel value = await _apiService.getMainTabel(9);
    _serverList = value.data;
    _serverList.sort((a, b) => a.value.compareTo(b.value));
  }

  getTerms() async {
    QuickSelectModel value = await _apiService.getMainTabel(33);
    _termsList = value.data;
    _termsList.sort((a, b) => a.value.compareTo(b.value));
  }

  getAgents() async {
    QuickSelectModel value = await _apiService.getMainTabel(31);
    _agentsList = value.data;
    _agentsList.sort((a, b) => a.value.compareTo(b.value));
  }

  getEvvents() async {
    QuickSelectModel value = await _apiService.getMainTabel(7);
    _eventsList = value.data;
    _eventsList.sort((a, b) => a.value.compareTo(b.value));
  }

  List<Datum> get getHallList => _hallList;
  List<Datum> get getOrderStatusList => _orderstatusList;
  List<Datum> get getMenuList => _menuList;
  List<Datum> get getServerList => _serverList;
  List<Datum> get getTermsList => _termsList;
  List<Datum> get getAgentsList => _agentsList;
  List<Datum> get getEventsList => _eventsList;
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
