class GetOrderModel {
  bool? requestResponse;
  List<dynamic>? messages;
  Data? data;

  GetOrderModel({this.requestResponse, this.messages, this.data});

  GetOrderModel.fromJson(Map<String, dynamic> json) {
    requestResponse = json['RequestResponse'];
    if (json['Messages'] != null) {
      messages = <Null>[];
      json['Messages'].forEach((v) {
        // messages!.add(void.fromJson(v));
      });
    }
    data = json['Data'] != null ? Data.fromJson(json['Data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['RequestResponse'] = requestResponse;
    if (messages != null) {
      data['Messages'] = messages!.map((v) => v.toJson()).toList();
    }
    if (this.data != null) {
      data['Data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? totalCount;
  List<Entities>? entities;

  Data({this.totalCount, this.entities});

  Data.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'];
    if (json['entities'] != null) {
      entities = <Entities>[];
      json['entities'].forEach((v) {
        entities!.add(Entities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['totalCount'] = totalCount;
    if (entities != null) {
      data['entities'] = entities!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Entities {
  int? order;
  String? dateOrder;
  String? status;
  String? statusLabel;
  String? lastUpdate;
  bool? isRemind;
  double? sumTotal;
  int? bookingNumber;
  String? name;
  String? email;
  String? phone;
  String? fromDate;
  int? hall;
  String? hallName;
  String? lastUser;
  String? orderId;
  String? bookingId;
  String? tEventId;
  String? colorHexa;

  Entities(
      {this.order,
      this.dateOrder,
      this.status,
      this.statusLabel,
      this.lastUpdate,
      this.isRemind,
      this.sumTotal,
      this.bookingNumber,
      this.name,
      this.email,
      this.phone,
      this.fromDate,
      this.hall,
      this.hallName,
      this.lastUser,
      this.orderId,
      this.bookingId,
      this.tEventId,
      this.colorHexa});

  Entities.fromJson(Map<String, dynamic> json) {
    order = json['order'];
    dateOrder = json['date_order'];
    status = json['status'];
    statusLabel = json['StatusLabel'];
    lastUpdate = json['last_update'];
    isRemind = json['IsRemind'];
    sumTotal = json['sum_total'];
    bookingNumber = json['BookingNumber'];
    name = json['name'];
    email = json['Email'];
    phone = json['Phone'];
    fromDate = json['from_date'];
    hall = json['hall'];
    hallName = json['HallName'];
    lastUser = json['LastUser'];
    orderId = json['OrderId'];
    bookingId = json['BookingId'];
    tEventId = json['t_eventId'];
    colorHexa = json['colorHexa'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order'] = order;
    data['date_order'] = dateOrder;
    data['status'] = status;
    data['StatusLabel'] = statusLabel;
    data['last_update'] = lastUpdate;
    data['IsRemind'] = isRemind;
    data['sum_total'] = sumTotal;
    data['BookingNumber'] = bookingNumber;
    data['name'] = name;
    data['Email'] = email;
    data['Phone'] = phone;
    data['from_date'] = fromDate;
    data['hall'] = hall;
    data['HallName'] = hallName;
    data['LastUser'] = lastUser;
    data['OrderId'] = orderId;
    data['BookingId'] = bookingId;
    data['t_eventId'] = tEventId;
    data['colorHexa'] = colorHexa;
    return data;
  }
}
