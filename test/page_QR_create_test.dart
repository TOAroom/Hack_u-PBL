import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:go_router/go_router.dart';
//test
void main() {
  runApp(MyApp());
}

void back(BuildContext context) {
  context.pop();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'カード配布画面',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: QrCodeLayout(),
    );
  }
}

class QrCodeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
        backgroundColor: const Color.fromARGB(255, 47, 159, 167),

        centerTitle: true,
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          QrImageView(
            data: 'https://d.kuku.lu/7g2f2rfgv',
            //値渡しのために変更する必要あり（8/27 15:58）
            //プロタイプ用に画像を作ってリンクを張ってある状態（8/27 16:40）
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
