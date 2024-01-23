import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:project/model/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookService {
  Dio dio = Dio();
  var url = "http://localhost:3000/api/users/products";

  Future<List<BookModel>> getBooks() async {
    try {
      final response = await dio.get(url);
      log('Response: $response');

      if (response.statusCode == 200) {
        log("${response.statusCode}");
        final jsonData = response.data;
        final List<dynamic> allProducts = jsonData['datas'];
        return allProducts
            .map((product) => BookModel.fromJson(product))
            .toList();
      } else {
        log('Failed to load. Status code: ${response.statusCode}');
        throw Exception('Failed to load');
      }
    } catch (e) {
      log('Error in ApiService: $e');
      rethrow;
    }
  }
  getValues(key) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(key);
  }
}