import 'package:flutter/material.dart';

import '../../Models/order_details_model.dart';
import '../../Models/quick_select_model.dart';

class CreateOrderProvider with ChangeNotifier {
  /// Booking Details...
  // OrderDetailsModel? editModel;

  String? name = "";
  setname(String value) {
    name = value;
    // notifyListeners();
  }

  String? address1;
  setAddress1(String value) {
    address1 = value;
    notifyListeners();
  }

  String? telephone1;
  setTelephone1(String value) {
    telephone1 = value;
    notifyListeners();
  }

  String? email;
  setEmail(String value) {
    email = value;
    notifyListeners();
  }

  String? phone;
  setPhone(String value) {
    phone = value;
    notifyListeners();
  }

  // Order Details....//

  int? terms;
  setTems(Datum? datum) {
    terms = datum!.value;
    print("onChange$terms");
    notifyListeners();
  }

  String? orderStatus;
  setOrderStatus(Datum? datum) {
    orderStatus = datum!.value;
    print("orderStatus $orderStatus");
    notifyListeners();
  }

  int? agents;
  setAgent(Datum? datum) {
    agents = datum!.value;
    notifyListeners();
  }

  String? eventLocation;
  setEventLocation(String value) {
    eventLocation = value;
    notifyListeners();
  }

  int? events;
  setEvents(Datum? datum) {
    events = datum!.value;
    notifyListeners();
  }

  ///////////////  Events //////////////////////////////

  int? hall;
  setHall(Datum? datum) {
    hall = datum!.value;
    notifyListeners();
  }

  int? menu;
  setMenu(Datum? datum) {
    menu = datum!.value;
    notifyListeners();
  }

  int? servers;
  setServers(Datum? datum) {
    servers = datum!.value;
    notifyListeners();
  }

  DateTime? formDate;
  DateTime? toDate;
  DateTime? fromTime;
  DateTime? toTime;

  String? hebDate;
  setHebDate(String value) {
    hebDate = value;
    notifyListeners();
  }

  String? dayEvent;
  setDayEvent(String value) {
    dayEvent = value;
    notifyListeners();
  }

// Edit Order handle/ hare///
  bool editBool = false;
  setedit(bool edit) {
    editBool = edit;
    notifyListeners();
  }

  OrderDetailsModel? editModel;
  editOrder(OrderDetailsModel model) {
    print(model.data!.order);
    name = model.data!.booking!.name.toString();
    address1 = model.data!.booking!.address1.toString();
    telephone1 = model.data!.booking!.telefon1.toString();
    email = model.data!.booking!.emailAdress.toString();
    phone = model.data!.booking!.number.toString();
    terms = model.data!.booking!.terms == 0 ? null : model.data!.booking!.terms;
    orderStatus = model.data!.status;
    agents = model.data!.agent == 0 ? null : model.data!.agent;
    eventLocation = model.data!.eventLocation;
    events = model.data!.event == 0 ? null : model.data!.event;
    editModel = model;
    notifyListeners();
  }
}
