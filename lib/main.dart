import 'package:flutter/material.dart';
import 'card_list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ポイントカードアプリ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CardListPage(),
    );
  }
}
