import 'package:ProviderApi/user_model.dart';
import 'package:ProviderApi/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<UserProvider>(context);
    final users = data.user;
    final randUser = User(
      firstName: 'diyar',
      lastName: 'faraj',
      email: 'diyar.faraj@gmail.com',
    );
    return Scaffold(
      body: Center(
        child: Container(
          child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              return Center(
                child: Column(
                  children: [
                    Text(
                      users[index].firstName,
                      style: TextStyle(color: Colors.red),
                    ),
                    IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          data.addUser(randUser);
                        })
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
