class RegisterModel {
  RegisterModel({
    this.userName,
    this.firstName,
    this.lastName,
    this.firmName,
    this.password,
    this.email,
    this.phone,
  });
  String? userName;
  String? firstName;
  String? lastName;
  String? firmName;
  String? password;
  String? email;
  String? phone;

  Map<String, dynamic> toJson() => {
        "userName": userName,
        "firstName": firstName,
        "lastName": lastName,
        "firmName": firmName,
        "password": password,
        "email": email,
        "phone": phone,
      };
}

class RegisterResponseModel {
  RegisterResponseModel({
    this.requestResponse,
    this.messages,
    this.data,
  });

  bool? requestResponse;
  List<String>? messages;
  dynamic data;

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) =>
      RegisterResponseModel(
        requestResponse: json["RequestResponse"],
        messages: json["Messages"] == null
            ? []
            : List<String>.from(json["Messages"]!.map((x) => x)),
        data: json["Data"],
      );
}
