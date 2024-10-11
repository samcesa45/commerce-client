import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {
  String? token;
  final String appBaseUrl;

  late Map<String, String> _mainHeaders;

  ApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30);
    _mainHeaders = {
      "Content-type": "application/json; charset=UTF-8",
      "Authorization": token != null ? "Bearer $token" : ""
    };
  }

  void updateHeader(String token) {
    this.token = token;
    _mainHeaders = {
      "Content-type": "application/json; charset=UTF-8",
      "Authorization": "Bearer $token"
    };
  }

  Future<Response> getData(
    String uri,
  ) async {
    try {
      Response response = await get(uri, headers: _mainHeaders);
      return response;
    } catch (e) {
      return Response(statusCode: 500, statusText: e.toString());
    }
  }

  Future<Response> sendData(String uri, dynamic body) async {
    try {
      Response response = await post(uri, body, headers: _mainHeaders);
      print('data sent');
      return response;
    } catch (e) {
      return Response(statusCode: 500, statusText: e.toString());
    }
  }
}
