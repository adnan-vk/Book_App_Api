import 'package:flutter/material.dart';
import 'package:project/model/user_model.dart';
import 'package:project/service/user_service.dart';

class UserProvider extends ChangeNotifier {
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController emailController = TextEditingController();
  UserService userService = UserService();

  String? userStatusCode;
  String? createdStatusCode;

  createUser(UserModel userInfo) async {
    await userService.createUser(userInfo);
    createdStatusCode = userService.createdStatusCode;
    notifyListeners();
  }

  userLogin(UserModel userInfo) async {
    await userService.userLogin(userInfo);
    userStatusCode = userService.userStatusCode;
    notifyListeners();
  }
}
