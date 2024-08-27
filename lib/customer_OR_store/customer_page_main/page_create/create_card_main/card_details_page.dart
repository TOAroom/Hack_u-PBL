import 'package:flutter/material.dart';
import 'point_card.dart';

class CardDetailsPage extends StatefulWidget {
  final PointCard card;

  CardDetailsPage({required this.card});

  @override
  _CardDetailsPageState createState() => _CardDetailsPageState();
}

class _CardDetailsPageState extends State<CardDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.card.cardName} の詳細'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'ポイント: ${widget.card.points}',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _updatePoints(1),
              child: Text('ポイントを加算'),
            ),
            ElevatedButton(
              onPressed: () => _updatePoints(-1),
              child: Text('ポイントを減算'),
            ),
          ],
        ),
      ),
    );
  }

  void _updatePoints(int delta) {
    setState(() {
      widget.card.points += delta;
    });
  }
}
