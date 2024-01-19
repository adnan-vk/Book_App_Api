import 'package:flutter/material.dart';
import 'package:project/model/usermodel.dart';
import 'package:project/service/userservice.dart';

class UserProvider extends ChangeNotifier{
  TextEditingController usernamcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  UserService userService = UserService();

  String? userStatusCode;
  String? createdStatusCode;

  createUser(UserModel userInfo) async {
    await userService.createUser(userInfo);
    createdStatusCode = userService.createdStatusCode;
    notifyListeners();
  }

  userLogin(UserModel userInfo)async{
    await userService.userLogin(userInfo);
    userStatusCode = userService.userStatusCode;
    notifyListeners();
  }
}