import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:percent_indicator/percent_indicator.dart';
//
// 画面 取引
//
//

class Pagetransaction extends StatelessWidget {
  const Pagetransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: Pagetransaction2(),
    );
  }
}

final percentProvider = StateProvider((ref) {
  return 0.00;
});

class Pagetransaction2 extends ConsumerStatefulWidget {
  const Pagetransaction2({super.key});

  @override
  _Pagetransaction2State createState() => _Pagetransaction2State();
}

class _Pagetransaction2State extends ConsumerState<Pagetransaction2> {
  bool _hasStarted = false;

  @override
  void initState() {
    super.initState();
    // 画面が表示されたときに進捗を開始
    if (!_hasStarted) {
      _hasStarted = true;
      startProgress();
    }
  }

  void startProgress() async {
    final percentNotifier = ref.read(percentProvider.notifier);

    await Future.delayed(const Duration(seconds: 1));
    percentNotifier.state = 0.20;

    await Future.delayed(const Duration(seconds: 2));
    percentNotifier.state = 0.80;

    await Future.delayed(const Duration(seconds: 1));
    percentNotifier.state = 0.95;

    await Future.delayed(const Duration(seconds: 1));
    percentNotifier.state = 1.00;

    if (percentNotifier.state == 1.00) {
      if (mounted) {
        context.push('/givepoint');
      }
    }
  }

  // 戻るボタンを押したとき
  void back(BuildContext context) {
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final percent = ref.watch(percentProvider);

    final linear = LinearPercentIndicator(
      percent: percent,
      backgroundColor: Colors.grey,
      progressColor: Colors.green,
      animation: true,
      animationDuration: 100,
      animateFromLastPercent: true,
      alignment: MainAxisAlignment.center,
      lineHeight: 15,
      width: 350,
    );

    final column = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'ポイント付与相手を検索中',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
        linear,
      ],
    );

    final appBar = AppBar(
      /*leading: TextButton(
        onPressed: () => back(context),
        child: const Text(
          '戻る',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15.0,
          ),
        ),
      ),*/ //通信中（疑似的）に戻るボタンを押すとエラーが発生するためコメント化
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
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            column,
          ],
        ),
      ),
    );
  }
}
