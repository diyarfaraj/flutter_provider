import 'package:ProviderApi/user_model.dart';
import 'package:ProviderApi/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var data;
  bool _initState = true;
  @override
  void initState() {
    // TODO: implement initState
    /* Future.delayed(Duration(milliseconds: 1000)).then((_) {
      data = Provider.of<UserProvider>(context).getUserData();
    }); */
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_initState) {
      Provider.of<UserProvider>(context).getUserData();
    }
    _initState = false;
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    data = Provider.of<UserProvider>(context);
    final users = data.user;
    final randUser = User(
      firstName: 'diyar',
      lastName: 'faraj',
      email: 'diyar.faraj@gmail.com',
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("my usersss"),
        leading: IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            data.addUser(randUser);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Container(
            child: users.length > 0
                ? ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      return Center(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  users[index].firstName,
                                  style: TextStyle(color: Colors.red),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(users[index].lastName)
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  )
                : CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
