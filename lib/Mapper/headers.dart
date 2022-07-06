class Header {
  String responseCode;
  String responseMessage;

  Header({required this.responseCode, required this.responseMessage});

  factory Header.fromJson(Map<String, dynamic> json) {
    return Header(
      responseCode: json['responseCode'],
      responseMessage: json['responseMessage'],
    );
  }
}
