import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:yaqoob_test_project/Models/order_summery_model/order_summery_model.dart';

import '../../constants/constants.dart';
import '../../shared_service.dart';
import 'package:http/http.dart' as http;

class OrderSummeryProvider with ChangeNotifier {
  OrderSummerySaved? orderSummeryModel;

  final TextEditingController addCommon = TextEditingController();
  final TextEditingController numportions = TextEditingController();
  final TextEditingController possiblePortions = TextEditingController();
  final TextEditingController addition = TextEditingController();
  final TextEditingController man = TextEditingController();
  final TextEditingController lastUser = TextEditingController();
  final TextEditingController text = TextEditingController();
  final TextEditingController dateFinish = TextEditingController();
  final TextEditingController cost = TextEditingController();
  final TextEditingController minPortions = TextEditingController();
  final TextEditingController practical = TextEditingController();
  final TextEditingController dutyHist = TextEditingController();
  final TextEditingController lastUpdate = TextEditingController();
  final TextEditingController discount = TextEditingController();
  final TextEditingController perctage = TextEditingController();
  final TextEditingController tSum = TextEditingController();
  final TextEditingController tMamSum = TextEditingController();
  final TextEditingController sumTotal = TextEditingController();

  DateTime? lastUpdateValue, dateFinishValue;
// void

  bool includeVat = false;

  void changeIncludeVatValue(bool value) {
    includeVat = value;
    notifyListeners();
  }

  void orderSummeryVaildtion() async {
    orderSummeryModel = OrderSummerySaved(
      addCommon: doubleValue(addCommon.text),
      order: 124380,
      numPortions: intValue(numportions.text),
      possiblePortions: intValue(possiblePortions.text),
      addition1: doubleValue(addition.text),
      cost1: doubleValue(cost.text),
      minPortions: intValue(minPortions.text),
      practical: intValue(practical.text),
      dutyHist: doubleValue(dutyHist.text),
      includeVat: includeVat,
      lastUpdate: lastUpdateValue == null
          ? DateTime.now().toString()
          : lastUpdateValue.toString(),
      discount2: doubleValue(discount.text),
      discountPercent: doubleValue(perctage.text),
      sumTotal: doubleValue(sumTotal.text),
      text1: text.text,
      lastUser: lastUser.text,
      man2: man.text,
      tMamSum: doubleValue(tMamSum.text),
      tSum: doubleValue(tSum.text),
      dateFinish: dateFinishValue == null
          ? DateTime.now().toString()
          : dateFinishValue.toString(),
    );
    await savedOrdersSummery(jsonValue: orderSummeryModel!.toJson());
  }

  bool isLoading = false;

  Future savedOrdersSummery({required Map<String, dynamic> jsonValue}) async {
    String? value = await SharedService.getToken();
    String url = "$baseUrl/OrderMob/SaveOrderSummary";
    try {
      isLoading = true;
      notifyListeners();
      final response = await http.post(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json; charset=utf-8",
          "Authorization": "Bearer $value",
        },
        body: jsonEncode(jsonValue),
      );

      if (response.statusCode == 200 || response.statusCode == 400) {
        var map = jsonDecode(response.body);
        Fluttertoast.showToast(msg: map["Messages"].first);
        isLoading = false;
        notifyListeners();
      }
    } catch (e) {
      isLoading = false;
      notifyListeners();
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  bool isEditAble = false;
  bool isEditLoading = false;
  Future getOrdersSummery() async {
    String? value = await SharedService.getToken();
    String url = "$baseUrl/OrderMob/GetOrderSummary?order=124380";
    try {
      isEditLoading = true;
      notifyListeners();
      final response = await http.get(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json; charset=utf-8",
          "Authorization": "Bearer $value",
        },
      );
      // print(response.body);
      if (response.statusCode == 200) {
        var map = jsonDecode(response.body);
        OrderSummerySaved orderValue = OrderSummerySaved.fromJson(map["Data"]);
        includeVat = orderValue.includeVat;
        lastUpdateValue = DateTime.parse(orderValue.lastUpdate!);
        dateFinishValue = DateTime.parse(orderValue.dateFinish!);
        addCommon.text = stringValue(orderValue.addCommon);
        numportions.text = stringValue(orderValue.numPortions);
        possiblePortions.text = stringValue(orderValue.possiblePortions);
        addition.text = stringValue(orderValue.addition1);
        man.text = stringValue(orderValue.man2);
        lastUser.text = stringValue(orderValue.lastUser);
        text.text = stringValue(orderValue.text1);
        dateFinish.text = stringValue(orderValue.dateFinish);
        cost.text = stringValue(orderValue.cost1);
        minPortions.text = stringValue(orderValue.minPortions);
        practical.text = stringValue(orderValue.practical);
        dutyHist.text = stringValue(orderValue.dutyHist);
        lastUpdate.text = orderValue.lastUpdate!;
        discount.text = stringValue(orderValue.discount2);
        perctage.text = stringValue(orderValue.discountPercent);
        tSum.text = stringValue(orderValue.tSum);
        tMamSum.text = stringValue(orderValue.tMamSum);
        sumTotal.text = stringValue(orderValue.sumTotal);
        isEditLoading = false;
        isEditAble = true;
        notifyListeners();
      }
    } catch (e) {
      isEditLoading = false;
      notifyListeners();
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  @override
  void dispose() {
    super.dispose();
    dateFinish.dispose();
    cost.dispose();
    minPortions.dispose();
    practical.dispose();
    dutyHist.dispose();
    lastUpdate.dispose();
    discount.dispose();
    perctage.dispose();
    tSum.dispose();
    tMamSum.dispose();
    dutyHist.dispose();
    sumTotal.dispose();
    lastUpdate.dispose();
    addCommon.dispose();
    numportions.dispose();
    possiblePortions.dispose();
    addition.dispose();
    man.dispose();
    lastUser.dispose();
    text.dispose();
  }

  double doubleValue(String? value) {
    return value!.isEmpty ? 0.0 : double.parse(value);
  }

  int intValue(String? value) {
    return value!.isEmpty ? 0 : int.parse(value);
  }

  String stringValue(dynamic value) {
    return value.toString().isEmpty ? "" : value.toString();
  }
}
