import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:project/model/model.dart';
import 'package:project/service/bookservice.dart';

class BookProvider extends ChangeNotifier {
  // String search = "";
  // List<BookModel> searchList = [];

  // void searchResult(BuildContext context) {
  //   final dbProvider = Provider.of<DbProvider>(context, listen: false);
  //   final filteredTransaction = dbProvider.transaction
  //       .where((transactionlist) => transactionlist.discription
  //           .toLowerCase()
  //           .contains(search.toLowerCase()))
  //       .toList();
  //   dbProvider.filteredSearch(filteredTransaction);
  // }

  List<BookModel> booklist = [];
  BookService bookservice = BookService();

  Future<void> getBooks() async {
    try {
      booklist = await bookservice.getBooks();
      notifyListeners();
    } catch (e) {
      log('Error in BookProvider: $e');
    }
  }
}
