import 'package:ProviderApi/user_model.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  /*  UserProvider() {
    getUserData();
  } */
  List<User> user = List<User>();
  bool loading = false;

  getUserData() async {
    loading = true;
    user = await getUsers();
    loading = false;
    notifyListeners();
  }

  int newId = 455;
  void addUser(User currentUser) {
    newId++;
    final newUser = User(
        id: newId,
        firstName: currentUser.firstName,
        lastName: currentUser.lastName,
        email: currentUser.email,
        avatar: "dfsdfsdf");
    user.insert(0, newUser);
    notifyListeners();
  }
}
