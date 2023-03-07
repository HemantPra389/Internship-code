import 'package:flutter/material.dart';


import 'home_screen.dart';
import 'user_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Tracker App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/userList': (context) => UserList(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
