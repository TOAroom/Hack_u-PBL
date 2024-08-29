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
    final backButton = ElevatedButton(
      onPressed: () => back(context),
      // MEMO: primary は古くなったので backgroundColor へ変更しました
      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
      child: const Text('< 戻る'),
    );

    final appBar = AppBar(
      backgroundColor: const Color.fromARGB(255, 47, 159, 167),
      title: const Text(
        'ポイントカード作成',
        style: TextStyle(color: Colors.white),
      ),
      centerTitle: true,
    );

    return MaterialApp(
      title: 'ポイントカードアプリ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CardListPage(),
    );
  }
}
