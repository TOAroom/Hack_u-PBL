import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:go_router/go_router.dart';

//
// 画面 受け渡し
//
class Pagedelivery extends StatelessWidget {
  const Pagedelivery({super.key});

  // 戻るボタンを押したとき
  back(BuildContext context) {
    // 前の画面 へ戻る
    context.push('/s_main');
  }

  @override
  Widget build(BuildContext context) {
    // 画面の上に表示するバー
    String qrText = 'ポイントカード';
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
        title: Text(
          '配布用QR',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 94, 199, 73),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder<String>(
            future: _loadImageAsBase64(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    QrImageView(
                      data: snapshot.data!,
                      size: 300,
                    ),
                    Text('これはQRコードです'),
                  ],
                );
              }
            }),
      ),
    );
  }

  Future<String> _loadImageAsBase64() async {
    final ByteData bytes = await rootBundle.load("images/white.png");
    final Uint8List list = bytes.buffer.asUint8List();
    return base64Encode(list);
  }
}
