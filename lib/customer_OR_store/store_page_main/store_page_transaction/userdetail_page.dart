import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'userlist_page.dart';

class Userdetail extends StatefulWidget {
  @override
  _UserdetailState createState() => _UserdetailState();
}

class _UserdetailState extends State<Userdetail> {
  final userdata = [
    Users('yamada taro', '3ポイント', '2024/08/24'),
  ];

  int getPoint = 0;

  @override
  void initState() {
    super.initState();

    // ウィジェットが初期化された後にダイアログを表示する
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _addPoint(context, (int selectedPoint) {
        setState(() {
          getPoint = selectedPoint;
        });
      });
    });
  }

  back(BuildContext context) {
    // メイン画面 へ戻る
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
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
    return StatefulBuilder(builder: (BuildContext, StateSetter setState) {
      return Scaffold(
        appBar: appBar,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'yamada taro',
                style: const TextStyle(
                    fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16.0),
              Text(
                '保有ポイント: 3',
                style: const TextStyle(fontSize: 20.0),
              ),
              const SizedBox(height: 16.0),
              Text(
                '最終更新: 2024/08/24',
                style: const TextStyle(fontSize: 18.0, color: Colors.grey),
              ),
              const SizedBox(height: 35.0),
              ElevatedButton(
                child: Text('付与するポイント:'),
                onPressed: () {
                  _addPoint(context, (int selectedPoint) {
                    setState(() {
                      getPoint = selectedPoint;
                    });
                  });
                },
              ),
              Row(
                children: [
                  Text('選択したポイント: ' + getPoint.toString()),
                ],
              ),
              ElevatedButton(
                onPressed: () => context.push('/givecompletion'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  textStyle: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                child: const Text(
                  'ポイント付与',
                  style: TextStyle(color: Color.fromARGB(255, 48, 48, 48)),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  void _addPoint(BuildContext context, Function(int) onGetPoint) {
    int getPoint = 1;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            int ischecked = getPoint;
            return AlertDialog(
                title: Text('付与するポイント'),
                content: DropdownButton<int>(
                  value: ischecked,
                  onChanged: (int? value) {
                    setState(() {
                      ischecked = (value ?? ischecked);
                      getPoint = ischecked;
                    });
                  },
                  items: const [
                    DropdownMenuItem(value: 1, child: Text('1')),
                    DropdownMenuItem(value: 2, child: Text('2')),
                    DropdownMenuItem(value: 3, child: Text('3')),
                    DropdownMenuItem(value: 4, child: Text('4')),
                    DropdownMenuItem(value: 5, child: Text('5')),
                    DropdownMenuItem(value: 6, child: Text('6')),
                    DropdownMenuItem(value: 7, child: Text('7')),
                    DropdownMenuItem(value: 8, child: Text('8')),
                    DropdownMenuItem(value: 9, child: Text('9')),
                    DropdownMenuItem(value: 10, child: Text('10')),
                    DropdownMenuItem(value: 11, child: Text('11')),
                    DropdownMenuItem(value: 12, child: Text('12')),
                    DropdownMenuItem(value: 13, child: Text('13')),
                    DropdownMenuItem(value: 14, child: Text('14')),
                    DropdownMenuItem(value: 15, child: Text('15')),
                    DropdownMenuItem(value: 16, child: Text('16')),
                    DropdownMenuItem(value: 17, child: Text('17')),
                    DropdownMenuItem(value: 18, child: Text('18')),
                    DropdownMenuItem(value: 19, child: Text('19')),
                    DropdownMenuItem(value: 20, child: Text('20')),
                  ],
                ),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: () {
                            setState(() {
                              onGetPoint(getPoint);
                              Navigator.of(context).pop();
                            });
                          },
                          child: Text('追加')),
                    ],
                  )
                ]);
          });
        });
  }
}
