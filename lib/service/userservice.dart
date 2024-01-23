import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:project/model/usermodel.dart';

class UserService {
  String? userStatusCode;
  String? createdStatusCode;
  Dio dio = Dio();

  createUser(UserModel userInfo) async {
    const url = 'http://localhost:3000/api/users/signup';
    // log(url);
    try {
      Response response = await dio.post(url, data: userInfo.toJson());
      userStatusCode = response.statusCode.toString();

      if (response.statusCode == 200) {
        log('Account created');
      } else {
        log("Account not created. Status code: ${response.statusCode}");
        log("Response data: ${response.data}");
        return null;
      }
    } catch (e) {
      log("Error creating user: $e");
      rethrow;
    }
  }

  userLogin(UserModel userInfo) async {
    const url = "http://localhost:3000/api/users/login";

    try {
      Response response = await dio.post(url, data: userInfo.logIn());
      log("${response.statusCode}");
      if (response.statusCode == 200) {
        log('Successfully Logged In');
      } else {
        log("Not Logged In Status code: ${response.statusCode}");
        log("Response data: ${response.data}");
        return null;
      }
    } catch (e) {
      log("Error logging in $e");
      rethrow;
    }
  }
}
