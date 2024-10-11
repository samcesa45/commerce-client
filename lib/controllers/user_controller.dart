import 'package:get/get.dart';
import 'package:gx_tutorial/services/models/user.dart';
import 'package:gx_tutorial/services/repositories/user_repo.dart';
import 'dart:async';
import 'dart:convert';


class UserController extends GetxController {
  final UserRepo userRepo;
  UserController({required this.userRepo});

  List<dynamic> _userList = [];
  List<dynamic> get getUserList => _userList;

  Future<void> getUserProfileList() async {
    Response response = await userRepo.getUserProfile();

    if (response.statusCode == 200) {
      // _userList = [];
      // _userList.addAll(User.fromJson(response.body).name);
      final responseJson = jsonDecode(response.body) as Map<String, dynamic>;
      User.fromJson(responseJson);
      update();
    } else {}
  }

  // Future<void> getUserSignup() async {
  //   Response response = await userRepo.signupEmail(body)
  // }
}
