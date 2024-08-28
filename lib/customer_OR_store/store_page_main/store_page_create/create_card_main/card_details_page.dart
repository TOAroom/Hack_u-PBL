import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'point_card.dart';

class CardDetailsPage extends StatefulWidget {
  final PointCard card;

  CardDetailsPage({required this.card});

  @override
  _CardDetailsPageState createState() => _CardDetailsPageState();
}

class _CardDetailsPageState extends State<CardDetailsPage> {
  int _currentPoints = 0;
  bool _isFront = true;

  void _toggleCard() {
    setState(() {
      _isFront = !_isFront;
    });
  }

  back(BuildContext context) {
    // 前の画面 へ戻る
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final backButton = ElevatedButton(
      onPressed: () => back(context),
      // MEMO: primary は古くなったので backgroundColor へ変更しました
      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
      child: const Text('< 戻る'),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.card.cardName),
      ),
      body: Center(
        child: GestureDetector(
          onTap: _toggleCard, // カードをタップで表裏を切り替え
          child: Container(
            height: 200,
            width: 300,
            decoration: BoxDecoration(
              color: widget.card.color,
              image: widget.card.backgroundImagePath != null && _isFront
                  ? DecorationImage(
                      image: AssetImage(widget.card.backgroundImagePath!),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: _isFront
                ? Stack(
                    children: List.generate(
                      _currentPoints,
                      (index) => Positioned(
                        left: (index % 5) * 50.0,
                        top: (index ~/ 5) * 50.0,
                        child: Icon(
                          widget.card.stampIcon,
                          color: widget.card.stampColor,
                          size: 40,
                        ),
                      ),
                    ),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('カード名: ${widget.card.cardName}',
                          style: TextStyle(fontSize: 20)),
                      Text('備考: ${widget.card.note}',
                          style: TextStyle(fontSize: 16)),
                      Text('最大ポイント数: ${widget.card.maxPoints}',
                          style: TextStyle(fontSize: 16)),
                    ],
                  ),
          ),
        ),
      ),
      floatingActionButton: _isFront
          ? FloatingActionButton(
              onPressed: () {
                if (_currentPoints < widget.card.maxPoints) {
                  setState(() {
                    _currentPoints++;
                  });
                }
              },
              child: Icon(Icons.add),
            )
          : null,
    );
  }
}
