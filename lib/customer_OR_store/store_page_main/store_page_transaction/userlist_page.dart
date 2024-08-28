import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'userdetail_page.dart';

class Givepoint extends StatelessWidget {
  const Givepoint({super.key});

  // 戻るボタンを押したとき
  back(BuildContext context) {
    // メイン画面 へ戻る
    context.push('/main');
  }

  @override
  Widget build(BuildContext context) {
    // 画面の上に表示するバー
    final appBar = AppBar(
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
      automaticallyImplyLeading: false,
      backgroundColor: const Color.fromARGB(255, 47, 159, 167),
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
          onTap: () {
            //カードを押したときの処理↓
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    Userdetail(user: user), //最後あたりで定義しているページへの移動
              ),
            );
          },
          child: Container(
            height: 150, //カードの高さ変更

            //カードの文字表示などの設定
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      user.name,
                      style: const TextStyle(fontSize: 18.0),
                    ),
                    Text(
                      user.point,
                      style: const TextStyle(fontSize: 18.0),
                    ),
                    Text(
                      user.time,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      physics: BouncingScrollPhysics(), //一番下や上までスクロールしたときページがちょっとびよーんてなる
    );
  }
}
