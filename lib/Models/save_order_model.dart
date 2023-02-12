class SaveOrderModel {
  SaveOrderModel({
    this.status,
    this.event,
    this.invest,
    this.eventLocation,
    this.agent,
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

  String? status;
  int? event;
  String? invest;
  String? eventLocation;
  int? agent;

  dynamic telephon1;
  bool? isRemind;
  String? hallName;
  String? lastUser;
  int? addCommon;
  int? numPortions;
  int? possiblePostions;
  int? addition1;
  int? cost1;
  int? minPostions;
  int? practical;
  int? dutyHist;
  int? discount2;
  dynamic dateFinish;
  int? sumTotal;
  int? nextOrder;
  int? previousOrder;
  String? colorHexa;
  Booking? booking;
  List<Event>? events;

  factory SaveOrderModel.fromJson(Map<String, dynamic> json) => SaveOrderModel(
        status: json["status"],
        event: json["event"],
        invest: json["invest"],
        eventLocation: json["EventLocation"],
        agent: json["agent"],
        telephon1: json["telephon1"],
        isRemind: json["IsRemind"],
        hallName: json["HallName"],
        lastUser: json["LastUser"],
        addCommon: json["add_common"],
        numPortions: json["num_portions"],
        possiblePostions: json["possible_postions"],
        addition1: json["addition_1"],
        cost1: json["cost_1"],
        minPostions: json["min_postions"],
        practical: json["practical"],
        dutyHist: json["duty_hist"],
        discount2: json["discount_2"],
        dateFinish: json["date_finish"],
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
        "status": status,
        "event": event,
        "invest": invest,
        "EventLocation": eventLocation,
        "agent": agent,
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
        "date_finish": dateFinish,
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
    this.name,
    this.address1,
    this.telefon1,
    this.emailAdress,
    this.terms,
    this.number,
    this.picture,
  });

  String? name;
  String? address1;
  String? telefon1;
  dynamic emailAdress;
  int? terms;
  String? number;
  String? picture;

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
        name: json["name"],
        address1: json["address_1"],
        telefon1: json["telefon_1"],
        emailAdress: json["email_adress"],
        terms: json["terms"],
        number: json["num"],
        picture: json["picture"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "address_1": address1,
        "telefon_1": telefon1,
        "email_adress": emailAdress,
        "terms": terms,
        "num": number,
        "picture": picture,
      };
}

class Event {
  Event({
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

  DateTime? dateEvent;
  String? fromDate;
  String? toDate;
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
        dateEvent: json["date_event"] == null
            ? null
            : DateTime.parse(json["date_event"]),
        fromDate: json["from_date"],
        toDate: json["to_date"],
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
        "date_event": dateEvent?.toIso8601String(),
        "from_date": fromDate,
        "to_date": toDate,
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

class SaveOrderResponseModel {
  SaveOrderResponseModel({
    this.requestResponse,
    this.messages,
    this.data,
  });

  bool? requestResponse;
  List<String>? messages;
  int? data;

  factory SaveOrderResponseModel.fromJson(Map<String, dynamic> json) =>
      SaveOrderResponseModel(
        requestResponse: json["RequestResponse"],
        messages: json["Messages"] == null
            ? []
            : List<String>.from(json["Messages"]!.map((x) => x)),
        data: json["Data"],
      );
}
