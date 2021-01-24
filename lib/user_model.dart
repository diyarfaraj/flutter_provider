import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;

class User {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  User({this.id, this.email, this.firstName, this.lastName, this.avatar});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        email: json['email'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        avatar: json['avatar']);
  }
}

Future<List<User>> getUsers() async {
  List<User> users = [];
  try {
    final response = await http.get(
      "https://reqres.in/api/users?page=1",
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      var list = item['data'];
      list.forEach((element) {
        print(element);
        users.add(User.fromJson(element));
      });
    } else {
      print("not found");
    }
  } catch (e) {
    log(e);
  }
  return users;
}
