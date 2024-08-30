import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../store_page_main/store_Page_main.dart';

class c_Pagemain extends StatelessWidget {
  const c_Pagemain({super.key});

  void navigateTo(BuildContext context, String route) {
    context.push(route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton.icon(
            icon: const Icon(
              Icons.face,
              color: Colors.white,
              size: 40,
            ),
            label: Text(''),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Store_Pagemain()));
            },
          ),
        ],
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 35.0),
            ElevatedButton(
              onPressed: () => navigateTo(context, '/list'),
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
                'ポイントカード一覧',
                style: TextStyle(color: Color.fromARGB(255, 48, 48, 48)),
              ),
            ),
            const SizedBox(height: 35.0),
            ElevatedButton(
              onPressed: () => navigateTo(context, '/scaner'),
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
                'ポイントカード作成',
                style: TextStyle(color: Color.fromARGB(255, 48, 48, 48)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
