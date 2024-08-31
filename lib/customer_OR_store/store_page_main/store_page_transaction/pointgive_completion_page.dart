import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vscode_test/customer_OR_store/store_page_main/store_Page_main.dart';

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
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey, minimumSize: Size(double.infinity, 60)),
      child: const Text(
        'ホームに戻る',
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );

    // 画面の上に表示するバー
    final appBar = AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: const Color.fromARGB(255, 94, 199, 73),
      title: const Text(
        'ポイント付与完了',
        style: TextStyle(color: Colors.white),
      ),
      centerTitle: true,
    );

    // 画面全体
    return Scaffold(
        appBar: appBar,
        body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [const SizedBox(height: 0), backButton],
            )));
  }
}
