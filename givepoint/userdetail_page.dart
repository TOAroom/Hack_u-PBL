import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'userlist_page.dart';

class Userdetail extends StatelessWidget {
  back(BuildContext context) {
    // メイン画面 へ戻る
    context.pop();
  }

  final Users user;

  const Userdetail({Key? key, required this.user}) : super(key: key);

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
      automaticallyImplyLeading: false,
      backgroundColor: const Color.fromARGB(255, 47, 159, 167),
      title: const Text(
        'ポイント付与',
        style: TextStyle(color: Colors.white),
      ),
      centerTitle: true,
    );
    return Scaffold(
      appBar: appBar,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user.name,
              style:
                  const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            Text(
              '保有ポイント: ${user.point}',
              style: const TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 16.0),
            Text(
              '最終更新: ${user.time}',
              style: const TextStyle(fontSize: 18.0, color: Colors.grey),
            ),
            const SizedBox(height: 35.0),
            ElevatedButton(
              onPressed: () => context.push('/givecompletion'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: Size(double.infinity, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                textStyle:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
  }
}
