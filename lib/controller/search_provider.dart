import 'package:flutter/material.dart';
import 'package:project/controller/book_provider.dart';
import 'package:project/model/model.dart';
import 'package:project/service/book_service.dart';
import 'package:provider/provider.dart';

class SearchProvider extends ChangeNotifier {
  BookService bookService = BookService();
  List<BookModel> searchedList = [];

  loadBooks() async {
    final allData = await bookService.getBooks();
    searchedList = allData;
    notifyListeners();
  }
  search(String enterName, context) {
    final getPrvdr = Provider.of<BookProvider>(context, listen: false);
    if(enterName.isNotEmpty) {
      searchedList = getPrvdr.booklist
          .where((BookModel book) =>
              book.title!.toLowerCase().contains(enterName.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}