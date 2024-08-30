import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:bordered_text/bordered_text.dart';

class Customer_OR_Store extends StatelessWidget {
  Customer_OR_Store({super.key});

  void navigateTo(BuildContext context, String route) {
    context.push(route);
  }

  ButtonStyle style = ElevatedButton.styleFrom(
    backgroundColor: Colors.blue, //ボタンの背景色の指定
    foregroundColor: Colors.white, //ボタンの縁取り
    elevation: 5,
    padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 100),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(0.0), // 任意の角丸さを指定
    ),
    side: const BorderSide(color: Colors.white),
  );

  @override
  Widget build(BuildContext context) {
    //上のバーの設定
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 94, 199, 73),
        title: const Text(
          'ポケっとかーど',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontFamily: 'nicoca',
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => navigateTo(context, '/logo'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //客側への画面遷移
            ElevatedButton.icon(
              //ボタンのアイコンの設定
              icon: const Icon(
                Icons.face,
                color: Colors.white,
                size: 40,
              ),
              //ボタン内の文字の設定
              label: BorderedText(
                strokeWidth: 2.0,
                strokeColor: Colors.white,
                child: const Text(
                  'CUSTOMER',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              onPressed: () => navigateTo(context, '/main'),
              style: style,
            ),

            //店側への画面遷移
            ElevatedButton.icon(
              //ボタンのアイコンの設定
              icon: const Icon(
                Icons.home,
                color: Colors.white,
                size: 40,
              ),
              //ボタン内の文字の設定
              label: BorderedText(
                strokeWidth: 2.0,
                strokeColor: Colors.white,
                child: const Text(
                  'STORE',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              onPressed: () => navigateTo(context, '/s_main'),
              style: style,
            ),
          ],
        ),
      ),
    );
  }
}
