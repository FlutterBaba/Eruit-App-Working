class ProfileModel {
  ProfileModel({
    this.requestResponse,
    this.messages,
    this.data,
  });

  bool? requestResponse;
  List<dynamic>? messages;
  Data? data;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
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
    this.firstName,
    this.lastName,
    this.userName,
    this.profilePic,
    this.emailId,
    this.language,
    this.phone,
  });

  String? firstName;
  String? lastName;
  String? userName;
  String? profilePic;
  String? emailId;
  String? language;
  String? phone;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        firstName: json["FirstName"],
        lastName: json["LastName"],
        userName: json["UserName"],
        profilePic: json["ProfilePic"],
        emailId: json["EmailId"],
        language: json["Language"],
        phone: json["Phone"],
      );

  Map<String, dynamic> toJson() => {
        "FirstName": firstName,
        "LastName": lastName,
        "UserName": userName,
        "ProfilePic": profilePic,
        "EmailId": emailId,
        "Language": language,
        "Phone": phone,
      };
}
