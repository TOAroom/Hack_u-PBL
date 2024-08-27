import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:go_router/go_router.dart';

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
      title: 'QR Code Demo',
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
        title: Text('QR Code Demo'),
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
        child: Column(children: [
          QrImageView(
            data: 'https://www.youtube.com/',
            size: 200,
          ),
          Text('これはQRコードです'),
        ]),
      ),
    );
  }
}
