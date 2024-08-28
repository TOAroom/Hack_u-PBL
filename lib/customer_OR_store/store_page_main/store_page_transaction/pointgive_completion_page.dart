import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PointgiveCompletion extends StatelessWidget {
  const PointgiveCompletion({super.key});

  // 戻るボタンを押したとき
  back(BuildContext context) {
    // 前の画面 へ戻る
    context.push('/s_main');
  }

  @override
  Widget build(BuildContext context) {
    // 画面の上に表示するバー
    final appBar = AppBar(
      leading: TextButton(
        onPressed: () => back(context),
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
      backgroundColor: const Color.fromARGB(255, 47, 159, 167),
      title: const Text(
        'ポイント付与完了',
        style: TextStyle(color: Colors.white),
      ),
      centerTitle: true,
    );

    // 画面全体
    return Scaffold(
      appBar: appBar,
    );
  }
}
