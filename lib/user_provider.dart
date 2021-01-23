import 'package:ProviderApi/user_model.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  List<User> user = List<User>();
  bool loading = false;

  getUserData(context) async {
    loading = true;
    user = await getUsers(context);
    loading = false;

    notifyListeners();
  }
}
