class EventDetailModel {
  EventDetailModel({
    this.requestResponse,
    this.messages,
    this.data,
  });

  bool? requestResponse;
  List<dynamic>? messages;
  Data? data;

  factory EventDetailModel.fromJson(Map<String, dynamic> json) =>
      EventDetailModel(
        requestResponse: json["RequestResponse"],
        messages: json["Messages"] == null
            ? []
            : List<dynamic>.from(json["Messages"]!.map((x) => x)),
        data: json["Data"] == null ? null : Data.fromJson(json["Data"]),
      );

  Map<String, dynamic> toJson() => {
        "RequestResponse": requestResponse,
        "Messages":
            messages == null ? [] : List<dynamic>.from(messages!.map((x) => x)),
        "Data": data?.toJson(),
      };
}

class Data {
  Data({
    this.tEventId,
    this.order,
    this.dateEvent,
    this.fromDate,
    this.toDate,
    this.fromTime,
    this.toTime,
    this.commission,
    this.hebDate,
    this.dayEvent,
    this.hall,
    this.menu,
    this.server,
    this.hallName,
    this.menuName,
    this.serverName,
    this.totalItem,
    this.totalAmount,
    this.total,
    this.subTotal,
    this.editEventFlag,
    this.eventLine,
    this.eventItems,
  });

  String? tEventId;
  int? order;
  DateTime? dateEvent;
  DateTime? fromDate;
  DateTime? toDate;
  String? fromTime;
  String? toTime;
  dynamic commission;
  String? hebDate;
  String? dayEvent;
  int? hall;
  int? menu;
  int? server;
  String? hallName;
  String? menuName;
  String? serverName;
  int? totalItem;
  double? totalAmount;
  double? total;
  double? subTotal;
  bool? editEventFlag;
  int? eventLine;
  List<dynamic>? eventItems;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
        commission: json["Commission"],
        hebDate: json["HebDate"],
        dayEvent: json["DayEvent"],
        hall: json["hall"],
        menu: json["menu"],
        server: json["server"],
        hallName: json["HallName"],
        menuName: json["MenuName"],
        serverName: json["ServerName"],
        totalItem: json["TotalItem"],
        totalAmount: json["TotalAmount"],
        total: json["Total"],
        subTotal: json["SubTotal"],
        editEventFlag: json["editEventFlag"],
        eventLine: json["event_line"],
        eventItems: json["EventItems"] == null
            ? []
            : List<dynamic>.from(json["EventItems"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "t_eventId": tEventId,
        "order": order,
        "date_event": dateEvent?.toIso8601String(),
        "from_date": fromDate?.toIso8601String(),
        "to_date": toDate?.toIso8601String(),
        "from_time": fromTime,
        "to_time": toTime,
        "Commission": commission,
        "HebDate": hebDate,
        "DayEvent": dayEvent,
        "hall": hall,
        "menu": menu,
        "server": server,
        "HallName": hallName,
        "MenuName": menuName,
        "ServerName": serverName,
        "TotalItem": totalItem,
        "TotalAmount": totalAmount,
        "Total": total,
        "SubTotal": subTotal,
        "editEventFlag": editEventFlag,
        "event_line": eventLine,
        "EventItems": eventItems == null
            ? []
            : List<dynamic>.from(eventItems!.map((x) => x)),
      };
}
