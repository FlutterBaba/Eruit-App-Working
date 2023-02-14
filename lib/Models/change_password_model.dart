class ChangePasswordModel {
  ChangePasswordModel({
    this.oldPassword,
    this.newPassword,
  });

  String? oldPassword;
  String? newPassword;

  Map<String, dynamic> toJson() => {
        "oldPassword": oldPassword,
        "newPassword": newPassword,
      };
}

class ChangePasswordResponseModel {
  ChangePasswordResponseModel({
    this.requestResponse,
    this.messages,
    this.data,
  });

  bool? requestResponse;
  List<String>? messages;
  dynamic data;

  factory ChangePasswordResponseModel.fromJson(Map<String, dynamic> json) =>
      ChangePasswordResponseModel(
        requestResponse: json["RequestResponse"],
        messages: json["Messages"] == null
            ? []
            : List<String>.from(json["Messages"]!.map((x) => x)),
        data: json["Data"],
      );
}
