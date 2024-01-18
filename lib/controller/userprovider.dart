import 'package:flutter/material.dart';
import 'package:project/model/usermodel.dart';
import 'package:project/service/loginservice.dart';

class UserProvider extends ChangeNotifier{
  UserService userService = UserService();
  createUser(UserModel userInfo) async {
    await userService.createUser(userInfo);
    // createdStatusCode = _userService.createdStatusCode;
    notifyListeners();
  }

  // userLogin(UserModel userInfo)async{
  //   await userService.userLogin(userInfo);
  //   notifyListeners();
  // }
}