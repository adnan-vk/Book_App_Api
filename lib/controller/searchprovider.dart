import 'package:flutter/material.dart';
import 'package:project/controller/bookprovider.dart';
import 'package:project/model/model.dart';
import 'package:project/service/bookservice.dart';
import 'package:provider/provider.dart';

class SearchProvider extends ChangeNotifier{
  BookService bookService = BookService();
  TextEditingController searchController = TextEditingController();
  List<BookModel> searchedList = [];
  loadProducts() async {
    final allData = await bookService.getBooks();
    searchedList = allData;
    notifyListeners();
  }

  search(String enterName, context) {
    final getPrvdr = Provider.of<BookProvider>(context, listen: false);
    if (enterName.isEmpty) {
      searchedList = [...getPrvdr.booklist];
    } else {
      searchedList = getPrvdr.booklist
          .where((BookModel product) =>
              product.title!.toLowerCase().contains(enterName.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}