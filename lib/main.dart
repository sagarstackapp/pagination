import 'package:flutter/material.dart';
import 'package:pagination/pages/home_page/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pagination & Image Uploading Using DIO',
      home: Home(),
    );
  }
}
