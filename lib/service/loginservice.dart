import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:project/model/usermodel.dart';

class UserService {
  Dio dio = Dio();

  // createUser(UserModel userInfo) async {
  //   const url = 'http://localhost:3000/api/users/signup';
  //   log(url);
  //   try {
  //     Response response = await dio.post(url, data: userInfo.toJson());
  //     // createdStatusCode = response.statusCode.toString(); // Change this line

  //     if (response.statusCode == 201) {
  //       log('Account created');
  //     } else {
  //       log("Account not created. Status code: ${response.statusCode}");
  //       return null;
  //     }
  //   } catch (e) {
  //     throw e;
  //   }
  // }

  createUser(UserModel userInfo) async {
    const url = 'http://localhost:3000/api/users/signup';
    log(url);
    try {
      Response response = await dio.post(url, data: userInfo.toJson());

      if (response.statusCode == 200) {
        log('Account created');
      } else {
        log("Account not created. Status code: ${response.statusCode}");
        log("Response data: ${response.data}");
        return null;
      }
    } catch (e) {
      log("Error creating user: $e");
      throw e;
    }
  }

  // userLogin(UserModel userInfo)async{
  //   final url = "http://localhost:3000/api/users/login";

  //   try{
  //     Response response = await dio.post(url,data: userInfo.logIn());

  //     if (response.statusCode == 200) {
  //       log('Account created');
  //     } else {
  //       log("Account not created. Status code: ${response.statusCode}");
  //       log("Response data: ${response.data}");
  //       return null;
  //     }
  //   } catch (e) {
  //     log("Error creating user: $e");
  //     throw e;
  //   }
  // }
}
