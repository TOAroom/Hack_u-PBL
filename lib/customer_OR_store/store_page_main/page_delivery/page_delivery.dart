import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:go_router/go_router.dart';

//
// 画面 受け渡し
//
class Pagedelivery extends StatelessWidget {
  const Pagedelivery({super.key});

  // 戻るボタンを押したとき
  back(BuildContext context) {
    // 前の画面 へ戻る
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    // 画面の上に表示するバー
    final appBar = AppBar(
      backgroundColor: const Color.fromARGB(255, 47, 159, 167),
      title: const Text(
        'ポイントカード受け渡し',
        style: TextStyle(color: Colors.white),
      ),
      centerTitle: true,
    );

    // 戻るボタン
    final backButton = ElevatedButton(
      onPressed: () => back(context),
      // MEMO: primary は古くなったので backgroundColor へ変更しました
      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
      child: const Text('< 戻る'),
    );

    // 画面全体
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'カード配布画面',
          style: TextStyle(color: Colors.white),
        ),

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
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          QrImageView(
            data: 'https://d.kuku.lu/7g2f2rfgv',
            //値渡しのために変更する必要あり（8/27 15:58）
            //画像をbase64でエンコード、文字列としてQRコードを作成 -> 読み込みアプリ側でデコードして画像表示（8/27 23:28）
            //画像はストレージサーバに保存しておき、ストレージのURLを書いたQRコードを作成 -> 読み込みアプリでダウンロード（8/27 23:28）

            size: 200,
          ),
          const Text(
            '配布用QR',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 15.0,
            ),
          ),
        ]), //カラム、チルドレンを使って複数処理を書いている
      ),
    );
  }
}
