import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'point_card.dart';
import 'card_details_page.dart';

class CardListPage extends StatefulWidget {
  @override
  _CardListPageState createState() => _CardListPageState();
}

class _CardListPageState extends State<CardListPage> {
  List<PointCard> _cards = [];

  @override
  Widget build(BuildContext context) {
    back(BuildContext context) {
      // 前の画面 へ戻る
      context.pop();
    }

    ElevatedButton(
      onPressed: () => back(context),
      // MEMO: primary は古くなったので backgroundColor へ変更しました
      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
      child: const Text('< 戻る'),
    );

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
      body: _cards.isEmpty
          ? Center(child: Text('ポイントカードがありません。新しく作成してください。'))
          : ListView.builder(
              itemCount: _cards.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_cards[index].cardName),
                  subtitle: Text('ポイント: ${_cards[index].points}'),
                  onTap: () => _viewCardDetails(_cards[index]),
                  trailing: PopupMenuButton<String>(
                    onSelected: (value) {
                      if (value == 'edit') {
                        _editCard(_cards[index]);
                      } else if (value == 'delete') {
                        setState(() {
                          _cards.removeAt(index);
                        });
                      }
                    },
                    itemBuilder: (BuildContext context) {
                      return [
                        PopupMenuItem(
                          value: 'edit',
                          child: Text('編集'),
                        ),
                        PopupMenuItem(
                          value: 'delete',
                          child: Text('削除'),
                        ),
                      ];
                    },
                  ),
                );
              },
            ),
    );
  }

  void _createNewCard() {
    showDialog(
      context: context,
      builder: (context) {
        String cardName = '';

        return AlertDialog(
          title: Text('新しいポイントカードを作成'),
          content: TextField(
            onChanged: (value) {
              cardName = value;
            },
            decoration: InputDecoration(
              hintText: 'カード名を入力してください',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('キャンセル'),
            ),
            TextButton(
              onPressed: () {
                if (cardName.isNotEmpty) {
                  setState(() {
                    _cards.add(PointCard(cardName: cardName));
                  });
                }
                Navigator.of(context).pop();
              },
              child: Text('作成'),
            ),
          ],
        );
      },
    );
  }

  void _editCard(PointCard card) {
    showDialog(
      context: context,
      builder: (context) {
        String cardName = card.cardName;

        return AlertDialog(
          title: Text('ポイントカードを編集'),
          content: TextField(
            onChanged: (value) {
              cardName = value;
            },
            controller: TextEditingController(text: card.cardName),
            decoration: InputDecoration(
              hintText: 'カード名を入力してください',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('キャンセル'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  card.cardName = cardName;
                });
                Navigator.of(context).pop();
              },
              child: Text('保存'),
            ),
          ],
        );
      },
    );
  }

  void _viewCardDetails(PointCard card) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CardDetailsPage(card: card)),
    );
  }
}
