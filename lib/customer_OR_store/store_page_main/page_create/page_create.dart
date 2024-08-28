import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'create_card_main/create_card_main.dart';

//
// 画面 作成
//
class Pagecreate extends StatelessWidget {
  const Pagecreate({super.key});

  // 戻るボタンを押したとき
  back(BuildContext context) {
    // 前の画面 へ戻る
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    // 画面の上に表示するバー
    final appBar = AppBar(
      backgroundColor: const Color.fromARGB(255, 94, 199, 73),
      title: const Text(
        'ポイントカード作成',
        style: TextStyle(color: Colors.white),
      ),
      centerTitle: true,
    );

    // 進むボタン

    // 戻るボタン
    final backButton = ElevatedButton(
      onPressed: () => back(context),
      // MEMO: primary は古くなったので backgroundColor へ変更しました
      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
      child: const Text('< 戻る'),
    );

    // 画面全体
    return Scaffold(
      appBar: appBar,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            backButton,
            ElevatedButton(
              child: Text('ポイントカードを作成する'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CreateCardMain()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
