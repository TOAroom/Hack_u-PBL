import 'package:flutter/material.dart';
import 'point_card.dart';
import 'package:qr_flutter/qr_flutter.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 94, 199, 73),
        title: Text('カード名:  ' + widget.card.cardName,
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: _toggleCard, // カードをタップで表裏を切り替え
              child: Container(
                height: 190,
                width: 240,
                decoration: BoxDecoration(
                  color: widget.card.color,
                  border: Border.all(color: Colors.black, width: 0.1),
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
            SizedBox(height: 20),
            Text('配布用QRコード', style: TextStyle(fontSize: 16)),
            QrImageView(
              data: widget.card.cardName, // 表示したいデータ
              size: 200.0,
            ),
          ],
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
