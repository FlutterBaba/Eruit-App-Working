class HebdateDayEventByDateModel {
  HebdateDayEventByDateModel({
    this.requestResponse,
    this.messages,
    this.data,
  });

  bool? requestResponse;
  List<dynamic>? messages;
  Data? data;

  factory HebdateDayEventByDateModel.fromJson(Map<String, dynamic> json) =>
      HebdateDayEventByDateModel(
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
    this.hebdate,
    this.dayEvent,
  });

  String? hebdate;
  String? dayEvent;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        hebdate: json["Hebdate"],
        dayEvent: json["dayEvent"],
      );

  Map<String, dynamic> toJson() => {
        "Hebdate": hebdate,
        "dayEvent": dayEvent,
      };
}
