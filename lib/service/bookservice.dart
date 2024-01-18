import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:project/model/model.dart';

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
        print('Failed to load. Status code: ${response.statusCode}');
        throw Exception('Failed to load');
      }
    } catch (e) {
      print('Error in ApiService: $e');
      throw e;
    }
  }
}