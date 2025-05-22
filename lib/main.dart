import 'package:flutter/material.dart';
import 'screens/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toko Sepatu',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        fontFamily: 'Sans',
      ),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(), // ganti ke LoginScreen
    );
  }
}