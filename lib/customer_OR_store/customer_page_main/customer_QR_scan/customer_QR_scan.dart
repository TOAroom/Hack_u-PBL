import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomerQrScan extends StatelessWidget {
  const CustomerQrScan({super.key});

  // 戻るボタンを押したとき
  back(BuildContext context) {
    // 前の画面 へ戻る
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    // 戻るボタン
    final backButton = ElevatedButton(
      onPressed: () => back(context),
      // MEMO: primary は古くなったので backgroundColor へ変更しました
      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
      child: const Text('< 戻る'),
    );

    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          onPressed: () => back(context),
          child: const Text(
            '戻る',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 15.0,
            ),
          ),
        ),
        automaticallyImplyLeading:
            false, //デフォルトだと左上に←ボタン（よく見る戻るボタン）が出てくる。今回は「戻る」ボタンを自作したためfalseにしてある
        backgroundColor: const Color.fromARGB(255, 47, 167, 63),

        centerTitle: true,
      ),
    );
  }
}
