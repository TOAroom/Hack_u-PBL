import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:bordered_text/bordered_text.dart';

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
  bool _isCommunicating = false;
  int _currentIconIndex = 0;
  Timer? _timer;

  final List<IconData> wifiIcons = [
    Icons.network_wifi_1_bar,
    Icons.network_wifi_2_bar,
    Icons.network_wifi_3_bar,
    Icons.network_wifi,
    Icons.signal_wifi_4_bar,
  ];

  @override
  void initState() {
    super.initState();
    startIconRotation();
  }

  void startIconRotation() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _currentIconIndex = (_currentIconIndex + 1) % wifiIcons.length;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
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

    final appBar = AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: const Color.fromARGB(255, 94, 199, 73),
      title: const Text(
        '通信相手を探しています',
        style: TextStyle(color: Colors.white),
      ),
      centerTitle: true,
    );

    return Scaffold(
      appBar: appBar,
      body: Center(
        child: _isCommunicating
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    child: const Text(
                      'ポイント付与相手を検索中',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ),
                  linear,
                ],
              )
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    wifiIcons[_currentIconIndex],
                    size: 100,
                  ),
                  const SizedBox(height: 100),
                  ElevatedButton(
                    child: Text(
                      'スマホを近づけたらここをタッチ!',
                      style: TextStyle(color: Color.fromARGB(255, 94, 199, 73)),
                    ),
                    onPressed: () {
                      _timer?.cancel(); // ボタンが押されたらタイマーを停止
                      setState(() {
                        _isCommunicating = true;
                      });
                      startProgress(); // ボタンが押されたら進捗を開始
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      minimumSize: Size(100, 100),
                      side: BorderSide(color: Color.fromARGB(255, 94, 199, 73)),
                      textStyle: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
      ),
    );
  }
}
