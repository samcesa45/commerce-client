import 'package:get/get.dart';
import 'package:gx_tutorial/services/api/api_client.dart';

class UserRepo extends GetxService {
  final ApiClient apiClient;

  UserRepo({required this.apiClient});
  
  Future<Response> signupEmail(body) async {
    return await apiClient.sendData('/api/signup',body);
  }
  Future<Response> getUserProfile() async {
    return await apiClient.getData('/api/users/profile');
  }
}
