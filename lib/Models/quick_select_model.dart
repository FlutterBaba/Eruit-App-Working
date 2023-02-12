class QuickSelectModel {
  QuickSelectModel({
    required this.requestResponse,
    required this.messages,
    required this.data,
  });

  bool requestResponse;
  List<dynamic> messages;
  List<Datum> data;
  factory QuickSelectModel.fromJson(Map<String, dynamic> json) =>
      QuickSelectModel(
        requestResponse: json["RequestResponse"],
        messages: List<dynamic>.from(json["Messages"].map((x) => x)),
        data: List<Datum>.from(json["Data"].map((x) => Datum.fromJson(x))),
      );
  Map<String, dynamic> toJson() => {
        "RequestResponse": requestResponse,
        "Messages": List<dynamic>.from(messages.map((x) => x)),
        "Data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.text,
    required this.value,
  });

  String text;
  // ignore: prefer_typing_uninitialized_variables
  var value;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        text: json["Text"],
        value: json["Value"],
      );
  Map<String, dynamic> toJson() => {
        "Text": text,
        "Value": value,
      };
}
