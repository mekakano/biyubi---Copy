class BaseResponse<T> {
  T? header;
  T? payload;

  BaseResponse({required this.header, required this.payload});

  factory BaseResponse.fromJson(
      Map<String, dynamic> json, Function(Map<String, dynamic>) build) {
    return BaseResponse<T>(
        header: build(json["header"]), payload: build(json["payload"]));
  }
}
