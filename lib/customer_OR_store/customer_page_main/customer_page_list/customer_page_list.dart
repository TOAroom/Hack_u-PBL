import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Pagelist extends StatelessWidget {
  const Pagelist({super.key});

  // 戻るボタンを押したとき
  void back(BuildContext context) {
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
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
      automaticallyImplyLeading:
          false, //デフォルトだと左上に←ボタン（よく見る戻るボタン）が出てくる。今回は「戻る」ボタンを自作したためfalseにしてある
      backgroundColor: Color.fromARGB(255, 94, 199, 73),
      title: const Text(
        'ポイントカード一覧',
        style: TextStyle(color: Colors.white),
      ),
      centerTitle: true,
    );

    //画面表示
    return Scaffold(
      appBar: appBar,
      body: Scrollbar(child: MyListView()),
    );
  }
}

//データの変数名などの設定
class CardModel {
  final String name;
  final String point;
  final String time;
  CardModel(this.name, this.point, this.time);
}

//データ一覧
final models = [
  CardModel('カード1', '3ポイント', '2024/08/24'),
  CardModel('カード2', '5ポイント', '2024/08/24'),
  CardModel('カード3', '1ポイント', '2024/08/24'),
  CardModel('カード4', '3ポイント', '2024/08/24'),
  CardModel('カード5', '5ポイント', '2024/08/24'),
  CardModel('カード6', '1ポイント', '2024/08/24'),
  CardModel('カード7', '3ポイント', '2024/08/24'),
  CardModel('カード8', '5ポイント', '2024/08/24'),
  CardModel('カード9', '1ポイント', '2024/08/24'),
  CardModel('カード10', '3ポイント', '2024/08/24'),
  CardModel('カード11', '5ポイント', '2024/08/24'),
  CardModel('カード12', '1ポイント', '2024/08/24'),
];

class MyListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: models.length, //データの長さによって変わる。自分で数値を指定することもできる
      itemBuilder: (context, index) {
        final model = models[index]; //データの配列をmodelに代入してる？　よくわからん
        return GestureDetector(
          onTap: () {
            //カードを押したときの処理↓
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    CardDetailPage(model: model), //最後あたりで定義しているページへの移動
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
                      model.name, //さっきのmodelを使って表示する文字の指定
                      style: const TextStyle(fontSize: 18.0),
                    ),
                    Text(
                      model.point,
                      style: const TextStyle(fontSize: 18.0),
                    ),
                    Text(
                      model.time,
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

//カードを押したときに移動するページの設定　これはほかのファイルに別で作った方がいい説もある
class CardDetailPage extends StatelessWidget {
  final CardModel model;

  const CardDetailPage({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(model.name),
        backgroundColor: Color.fromARGB(255, 94, 199, 73),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              model.name,
              style:
                  const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            Text(
              'ポイント: ${model.point}',
              style: const TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 16.0),
            Text(
              '最終更新: ${model.time}',
              style: const TextStyle(fontSize: 18.0, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
