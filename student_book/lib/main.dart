import 'package:flutter/material.dart';
import 'package:student_book/pages/SignUp.dart';
import 'package:student_book/pages/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'E-commerce',
        theme: ThemeData(
            fontFamily: 'Metropolis',
            primarySwatch: Colors.blue,
            backgroundColor: Color(0xFFE5E5E5)),
        //home: SignIn(),
        initialRoute: '/lib/pages/Login',
        routes: {
          "/lib/pages/Login": (context) => SignIn(),
          "/lib/pages/SignUp": (context) => SignUp(),
        });
  }
}
