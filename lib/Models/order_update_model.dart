class OrderUpdateModel {
  OrderUpdateModel({
    this.order,
    this.orderId,
    this.status,
    this.event,
    this.invest,
    this.eventLocation,
    this.agent,
    this.dateOrder,
    this.lastUpdate,
    this.telephon1,
    this.isRemind,
    this.hallName,
    this.lastUser,
    this.addCommon,
    this.numPortions,
    this.possiblePostions,
    this.addition1,
    this.cost1,
    this.minPostions,
    this.practical,
    this.dutyHist,
    this.discount2,
    this.dateFinish,
    this.sumTotal,
    this.nextOrder,
    this.previousOrder,
    this.colorHexa,
    this.booking,
    this.events,
  });

  int? order;
  String? orderId;
  String? status;
  int? event;
  dynamic invest;
  dynamic eventLocation;
  int? agent;
  DateTime? dateOrder;
  DateTime? lastUpdate;
  String? telephon1;
  bool? isRemind;
  String? hallName;
  String? lastUser;
  double? addCommon;
  int? numPortions;
  int? possiblePostions;
  int? addition1;
  int? cost1;
  int? minPostions;
  int? practical;
  int? dutyHist;
  double? discount2;
  DateTime? dateFinish;
  int? sumTotal;
  int? nextOrder;
  int? previousOrder;
  String? colorHexa;
  Booking? booking;
  List<Event>? events;

  factory OrderUpdateModel.fromJson(Map<String, dynamic> json) =>
      OrderUpdateModel(
        order: json["order"],
        orderId: json["OrderId"],
        status: json["status"],
        event: json["event"],
        invest: json["invest"],
        eventLocation: json["EventLocation"],
        agent: json["agent"],
        dateOrder: json["date_order"] == null
            ? null
            : DateTime.parse(json["date_order"]),
        lastUpdate: json["last_update"] == null
            ? null
            : DateTime.parse(json["last_update"]),
        telephon1: json["telephon1"],
        isRemind: json["IsRemind"],
        hallName: json["HallName"],
        lastUser: json["LastUser"],
        addCommon: json["add_common"]?.toDouble(),
        numPortions: json["num_portions"],
        possiblePostions: json["possible_postions"],
        addition1: json["addition_1"],
        cost1: json["cost_1"],
        minPostions: json["min_postions"],
        practical: json["practical"],
        dutyHist: json["duty_hist"],
        discount2: json["discount_2"]?.toDouble(),
        dateFinish: json["date_finish"] == null
            ? null
            : DateTime.parse(json["date_finish"]),
        sumTotal: json["sum_total"],
        nextOrder: json["NextOrder"],
        previousOrder: json["PreviousOrder"],
        colorHexa: json["colorHexa"],
        booking:
            json["Booking"] == null ? null : Booking.fromJson(json["Booking"]),
        events: json["Events"] == null
            ? []
            : List<Event>.from(json["Events"]!.map((x) => Event.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "order": order,
        "OrderId": orderId,
        "status": status,
        "event": event,
        "invest": invest,
        "EventLocation": eventLocation,
        "agent": agent,
        "date_order": dateOrder?.toIso8601String(),
        "last_update": lastUpdate?.toIso8601String(),
        "telephon1": telephon1,
        "IsRemind": isRemind,
        "HallName": hallName,
        "LastUser": lastUser,
        "add_common": addCommon,
        "num_portions": numPortions,
        "possible_postions": possiblePostions,
        "addition_1": addition1,
        "cost_1": cost1,
        "min_postions": minPostions,
        "practical": practical,
        "duty_hist": dutyHist,
        "discount_2": discount2,
        "date_finish": dateFinish?.toIso8601String(),
        "sum_total": sumTotal,
        "NextOrder": nextOrder,
        "PreviousOrder": previousOrder,
        "colorHexa": colorHexa,
        "Booking": booking?.toJson(),
        "Events": events == null
            ? []
            : List<dynamic>.from(events!.map((x) => x.toJson())),
      };
}

class Booking {
  Booking({
    this.bookingNumber,
    this.bookingId,
    this.name,
    this.address1,
    this.telefon1,
    this.emailAdress,
    this.terms,
    this.number,
    this.picture,
  });

  int? bookingNumber;
  String? bookingId;
  String? name;
  String? address1;
  String? telefon1;
  String? emailAdress;
  int? terms;
  String? number;
  String? picture;

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
        bookingNumber: json["BookingNumber"],
        bookingId: json["BookingId"],
        name: json["name"],
        address1: json["address_1"],
        telefon1: json["telefon_1"],
        emailAdress: json["email_adress"],
        terms: json["terms"],
        number: json["num"],
        picture: json["picture"],
      );

  Map<String, dynamic> toJson() => {
        "BookingNumber": bookingNumber,
        "BookingId": bookingId,
        "name": name,
        "address_1": address1,
        "telefon_1": telefon1,
        "email_adress": emailAdress,
        "terms": terms,
        "num": num,
        "picture": picture,
      };
}

class Event {
  Event({
    this.tEventId,
    this.order,
    this.dateEvent,
    this.fromDate,
    this.toDate,
    this.fromTime,
    this.toTime,
    this.hallName,
    this.menuName,
    this.serverName,
    this.hall,
    this.menu,
    this.server,
    this.commission,
    this.editEventFlag,
  });

  String? tEventId;
  int? order;
  DateTime? dateEvent;
  DateTime? fromDate;
  DateTime? toDate;
  String? fromTime;
  String? toTime;
  String? hallName;
  String? menuName;
  String? serverName;
  int? hall;
  int? menu;
  int? server;
  dynamic commission;
  bool? editEventFlag;

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        tEventId: json["t_eventId"],
        order: json["order"],
        dateEvent: json["date_event"] == null
            ? null
            : DateTime.parse(json["date_event"]),
        fromDate: json["from_date"] == null
            ? null
            : DateTime.parse(json["from_date"]),
        toDate:
            json["to_date"] == null ? null : DateTime.parse(json["to_date"]),
        fromTime: json["from_time"],
        toTime: json["to_time"],
        hallName: json["HallName"],
        menuName: json["MenuName"],
        serverName: json["ServerName"],
        hall: json["hall"],
        menu: json["menu"],
        server: json["server"],
        commission: json["Commission"],
        editEventFlag: json["editEventFlag"],
      );

  Map<String, dynamic> toJson() => {
        "t_eventId": tEventId,
        "order": order,
        "date_event": dateEvent?.toIso8601String(),
        "from_date": fromDate?.toIso8601String(),
        "to_date": toDate?.toIso8601String(),
        "from_time": fromTime,
        "to_time": toTime,
        "HallName": hallName,
        "MenuName": menuName,
        "ServerName": serverName,
        "hall": hall,
        "menu": menu,
        "server": server,
        "Commission": commission,
        "editEventFlag": editEventFlag,
      };
}
