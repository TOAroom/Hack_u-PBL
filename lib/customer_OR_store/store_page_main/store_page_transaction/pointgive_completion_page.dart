import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'userlist_page.dart';

class PointgiveCompletion extends StatelessWidget {
  const PointgiveCompletion({super.key});

  // ホームに戻るボタンを押したとき
  back(BuildContext context) {
    // メニュー選択 へ戻る
    context.push('/s_main');
  }

  @override
  Widget build(BuildContext context) {
    //ひとつ前の画面に戻るボタンの変数宣言
    final backButton = ElevatedButton(
      onPressed: () => back(context),
      // MEMO: primary は古くなったので backgroundColor へ変更しました
      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
      child: const Text('< ホームに戻る'),
    );

    // 画面の上に表示するバー
    final appBar = AppBar(
      leading: TextButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Givepoint()));
        },
        child: const Text(
          '完了',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15.0,
          ),
        ),
      ),
      automaticallyImplyLeading: false,
      backgroundColor: const Color.fromARGB(255, 94, 199, 73),
      title: const Text(
        'ポイント付与完了',
        style: TextStyle(color: Colors.white),
      ),
      centerTitle: true,
    );

    // 画面全体
    return Scaffold(appBar: appBar, body: Center(child: backButton));
  }
}
