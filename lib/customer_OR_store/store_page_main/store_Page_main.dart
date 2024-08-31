import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../customer_page_main/customer_page_main.dart';

class Store_Pagemain extends StatelessWidget {
  const Store_Pagemain({super.key});

  void navigateTo(BuildContext context, String route) {
    context.push(route);
  }

  @override
  Widget build(BuildContext context) {
    // 画面の上に表示するバー
    final appBar = AppBar(
      actions: [
        TextButton.icon(
          icon: const Icon(
            Icons.home,
            color: Colors.white,
            size: 40,
          ),
          label: Text(''),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => c_Pagemain()));
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
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () => navigateTo(context, '/choice_cs'),
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () => navigateTo(context, '/create'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                minimumSize: Size(10, 100),
                side: BorderSide(color: Color.fromARGB(255, 94, 199, 73)),
                textStyle:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              child: const Text(
                'ポイントカード作成',
                style: TextStyle(color: Color.fromARGB(255, 94, 199, 73)),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => navigateTo(context, '/delivery'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                minimumSize: Size(10, 100),
                side: BorderSide(color: Color.fromARGB(255, 94, 199, 73)),
                textStyle:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              child: const Text(
                'ポイントカード受け渡し',
                style: TextStyle(color: Color.fromARGB(255, 94, 199, 73)),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => navigateTo(context, '/transaction'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                minimumSize: Size(100, 100),
                side: BorderSide(color: Color.fromARGB(255, 94, 199, 73)),
                textStyle:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              child: const Text(
                'ポイント付与',
                style: TextStyle(color: Color.fromARGB(255, 94, 199, 73)),
              ),
            ),
            const SizedBox(height: 35.0),
          ],
        ),
      ),
    );
  }
}
