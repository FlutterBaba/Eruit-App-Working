class LoginResponseModel {
  bool? requestResponse;
  List<dynamic>? messages;
  String? data;
  LoginResponseModel({
    this.requestResponse,
    this.messages,
    this.data,
  });
  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        requestResponse: json["RequestResponse"],
        messages: List<dynamic>.from(
          json["Messages"].map((x) => x),
        ),
        data: json["Data"],
      );

  Map<String, dynamic> toJson() => {
        "RequestResponse": requestResponse,
        "Messages": List<dynamic>.from(
          messages!.map((x) => x),
        ),
        "Data": data,
      };
}
