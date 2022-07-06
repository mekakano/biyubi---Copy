class BaseResponse2<T> {
  bool status;
  String message;
  T? data;

  BaseResponse2(
      {required this.status, required this.message, required this.data});

  factory BaseResponse2.fromJson(
      Map<String, dynamic> json, Function(Map<String, dynamic>) build) {
    return BaseResponse2<T>(
        status: json["status"],
        message: json["message"],
        data: build(json["data"]));
  }
}
