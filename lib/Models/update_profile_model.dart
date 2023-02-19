class UpdateProfileResponseModel {
  UpdateProfileResponseModel({
    this.requestResponse,
    this.messages,
    this.data,
  });

  bool? requestResponse;
  List<String>? messages;
  dynamic data;

  factory UpdateProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      UpdateProfileResponseModel(
        requestResponse: json["RequestResponse"],
        messages: json["Messages"] == null
            ? []
            : List<String>.from(json["Messages"]!.map((x) => x)),
        data: json["Data"],
      );
}
