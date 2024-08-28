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
    context.push('/s_main');
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

    ButtonStyle style = ElevatedButton.styleFrom(
      elevation: 5,
      padding: const EdgeInsets.symmetric(horizontal: 75, vertical: 50),
    );

    // 画面全体
    return Scaffold(
      appBar: appBar,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //backButton,
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CreateCardMain()));
              },
              style: style,
              child: const Text(
                'ポイントカードを作成する',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
