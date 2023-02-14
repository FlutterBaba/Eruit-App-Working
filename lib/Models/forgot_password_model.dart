class ForgotPasswordModel {
  ForgotPasswordModel({
    this.userName,
    this.emailId,
  });
  String? userName;
  String? emailId;

  Map<String, dynamic> toJson() => {
        "userName": userName,
        "emailId": emailId,
      };
}

class ForgotPasswordResponseModel {
  ForgotPasswordResponseModel({
    this.requestResponse,
    this.messages,
    this.data,
  });
  bool? requestResponse;
  List<String>? messages;
  dynamic data;
  factory ForgotPasswordResponseModel.fromJson(Map<String, dynamic> json) =>
      ForgotPasswordResponseModel(
        requestResponse: json["RequestResponse"],
        messages: json["Messages"] == null
            ? []
            : List<String>.from(json["Messages"]!.map((x) => x)),
        data: json["Data"],
      );
}
