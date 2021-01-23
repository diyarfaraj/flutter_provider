import 'package:ProviderApi/user_model.dart';
import 'package:ProviderApi/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<UserProvider>(context);
    final users = data.user;
    return Scaffold(
      body: Center(
        child: Container(
          child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              return Center(
                child: Column(
                  children: [
                    Text(users[index].firstName),
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
