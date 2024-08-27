import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'card_list_page.dart';

class CreateCardMain extends StatelessWidget {
  // 戻るボタンを押したとき
  back(BuildContext context) {
    // 前の画面 へ戻る
    context.pop();
  }

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
