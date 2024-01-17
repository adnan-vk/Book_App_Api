import 'package:flutter/material.dart';
import 'package:project/model/model.dart';
import 'package:project/service/bookservice.dart';

class BookProvider extends ChangeNotifier {
  List<BookModel> booklist = [];
  BookService bookservice = BookService();

  Future<void> getBooks() async {
    try {
      booklist = await bookservice.getBooks();
      notifyListeners();
    } catch (e) {
      print('Error in BookProvider: $e');
    }
  }
}
