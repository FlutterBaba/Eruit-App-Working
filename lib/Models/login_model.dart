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
}

class LoginModel {
  LoginModel({
    this.userName,
    this.password,
  });
  String? userName;
  String? password;
  Map<String, dynamic> toJson() => {
        "userName": userName,
        "password": password,
      };
}
