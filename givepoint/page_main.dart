import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Pagemain extends StatelessWidget {
  const Pagemain({super.key});

  void navigateTo(BuildContext context, String route) {
    context.push(route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 94, 199, 73),
        title: const Text(
          'ポケっとかーど',
          style: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () => navigateTo(context, '/create'),
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
              onPressed: () => navigateTo(context, '/delivery'),
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
                'ポイントカード受け渡し',
                style: TextStyle(color: Color.fromARGB(255, 48, 48, 48)),
              ),
            ),
            const SizedBox(height: 35.0),
            ElevatedButton(
              onPressed: () => navigateTo(context, '/transaction'),
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
