
import 'package:flutter/material.dart';
import 'package:project/service/shrdprf.dart';

class ShrdProvider extends ChangeNotifier {
  shrdService store = shrdService();
  setToken(tokenId) async {
    await store.setToken(tokenId);
    notifyListeners();
  }

  getToken() async {
    return store.getToken();
  }

  clearToken() async {
    await store.clearToken();
    notifyListeners();
  }

  setUserId(userId) async {
    await store.setUserId(userId);
    notifyListeners();
  }

  getUserId() async {
    return store.getUserId();
  }

  clearUserId() async {
    await store.clearUserId();
    notifyListeners();
  }
}
