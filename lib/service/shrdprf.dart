import 'package:shared_preferences/shared_preferences.dart';

class ShrdService {
  setToken(tokenId) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('Token', tokenId);
  }

  getToken() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('Token');
  }

  clearToken() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }

  setUserId(userId) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('userId', userId);
  }

  getUserId() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('userId');
  }

  clearUserId() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }
}
