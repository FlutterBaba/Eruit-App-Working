import 'dart:convert';

OrderSummerySaved orderSummerySavedFromJson(String str) =>
    OrderSummerySaved.fromJson(json.decode(str));

String orderSummerySavedToJson(OrderSummerySaved data) =>
    json.encode(data.toJson());

class OrderSummerySaved {
  OrderSummerySaved({
    required this.addCommon,
    required this.numPortions,
    required this.possiblePortions,
    required this.addition1,
     this.dateFinish,
    required this.cost1,
    required this.minPortions,
    required this.practical,
    required this.dutyHist,
    required this.includeVat,
    required this.discount2,
    required this.discountPercent,
    this.text1,
    required this.sumTotal,
     this.lastUpdate,
    required this.tMamSum,
    required this.tSum,
    required this.man2,
    required this.lastUser,
    required this.order,
  });

  double addCommon;
  int order;
  int numPortions;
  int possiblePortions;
  double addition1;
  String? dateFinish;
  double cost1;
  int minPortions;
  int practical;
  double dutyHist;
  bool includeVat;
  double discount2;
  double discountPercent;
  dynamic text1;
  double sumTotal;
  String? lastUpdate;
  double tMamSum;
  double tSum;
  String man2;
  String lastUser;

  factory OrderSummerySaved.fromJson(Map<String, dynamic> json) =>
      OrderSummerySaved(
        addCommon: doubleValue(json["add_common"]),
        numPortions: intValue(json["num_portions"]),
        possiblePortions: intValue(json["possible_portions"]),
        addition1: doubleValue(json["addition_1"]),
        dateFinish: json["date_finish"],
        cost1: doubleValue(json["cost_1"]),
        minPortions: intValue(json["min_portions"]),
        practical: intValue(json["practical"]),
        order: json["order"] ?? 0,
        dutyHist: doubleValue(json["duty_hist"]),
        includeVat: json["Include_Vat"] ?? false,
        discount2: doubleValue(json["discount_2"]),
        discountPercent: doubleValue(json["discount_percent"]),
        text1: json["text_1"] ?? "",
        sumTotal: doubleValue(json["sum_total"]),
        lastUpdate: json["last_update"] ?? "",
        tMamSum: doubleValue(json["t_mam_sum"]),
        tSum: doubleValue(json["t_sum"]),
        man2: json["man_2"] ?? "",
        lastUser: json["last_user"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "add_common": addCommon,
        "order": order,
        "num_portions": numPortions,
        "possible_portions": possiblePortions,
        "addition_1": addition1,
        "date_finish": dateFinish,
        "cost_1": cost1,
        "min_portions": minPortions,
        "practical": practical,
        "duty_hist": dutyHist,
        "isIncludeVAT": includeVat,
        "discount_2": discount2,
        "discount_percent": discountPercent,
        // "text_1": text1,
        "sum_total": sumTotal,
        "last_update": lastUpdate,
        "t_mam_sum": tMamSum,
        "t_sum": tSum,
        "man_2": man2,
        "last_user": lastUser,
      };

  static double doubleValue(dynamic value) {
    return value.toString().isEmpty ? 0.0 : double.parse(value.toString());
  }

  static int intValue(dynamic value) {
    return value.toString().isEmpty ? 0 : int.parse(value.toString());
  }

  static String stringValue(dynamic value) {
    return value.toString().isEmpty ? "" : value.toString();
  }
}
