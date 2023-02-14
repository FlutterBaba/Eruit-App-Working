class DeleteAccountResponse {
  DeleteAccountResponse({
    this.requestResponse,
    this.messages,
    this.data,
  });

  bool? requestResponse;
  List<String>? messages;
  dynamic data;

  factory DeleteAccountResponse.fromJson(Map<String, dynamic> json) =>
      DeleteAccountResponse(
        requestResponse: json["RequestResponse"],
        messages: json["Messages"] == null
            ? []
            : List<String>.from(json["Messages"]!.map((x) => x)),
        data: json["Data"],
      );

  Map<String, dynamic> toJson() => {
        "RequestResponse": requestResponse,
        "Messages":
            messages == null ? [] : List<dynamic>.from(messages!.map((x) => x)),
        "Data": data,
      };
}
