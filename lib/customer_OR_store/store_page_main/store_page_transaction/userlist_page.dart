import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vscode_test/customer_OR_store/store_page_main/store_page_transaction/page_transaction.dart';

import 'userdetail_page.dart';

class Givepoint extends StatelessWidget {
  const Givepoint({super.key});

  // 戻るボタンを押したとき
  back(BuildContext context) {
    // メイン画面 へ戻る
    context.push('/s_main');
  }

  @override
  Widget build(BuildContext context) {
    // 画面の上に表示するバー
    final appBar = AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () => back(context),
      ),
      automaticallyImplyLeading: false,
      backgroundColor: const Color.fromARGB(255, 94, 199, 73),
      title: const Text(
        'ポイント付与',
        style: TextStyle(color: Colors.white),
      ),
      centerTitle: true,
    );

    // 画面全体
    return Scaffold(
      appBar: appBar,
      body: Scrollbar(child: Userlist()),
    );
  }
}

class Users {
  final String name;
  final String point;
  final String time;
  Users(this.name, this.point, this.time);
}

//データ一覧
final userdata = [
  Users('yamada taro', '3ポイント', '2024/08/24'),
];

class Userlist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: userdata.length, //データの長さによって変わる。自分で数値を指定することもできる
      itemBuilder: (context, index) {
        final user = userdata[index]; //データの配列をuserに代入してる？　よくわからん
        return GestureDetector(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Userdetail()));
            },
            //カードの文字表示などの設定
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'yamada taro',
                    style: const TextStyle(fontSize: 18.0),
                  ),
                  Text(
                    '3ポイント',
                    style: const TextStyle(fontSize: 18.0),
                  ),
                  Text(
                    '2024/08/24',
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      physics: BouncingScrollPhysics(), //一番下や上までスクロールしたときページがちょっとびよーんてなる
    );
  }
}
