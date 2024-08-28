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

  void _createNewCard() {
    String cardName = '';
    String cardNote = '';
    Color selectedColor = Colors.blue;
    List<IconData> selectedIcons = [];
    int maxPoints = 20;
    String? backgroundImagePath;
    IconData stampIcon = Icons.circle;
    Color stampColor = Colors.red;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('新しいポイントカードを作成'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  onChanged: (value) {
                    cardName = value;
                  },
                  decoration: InputDecoration(
                    hintText: 'カード名を入力してください',
                  ),
                ),
                TextField(
                  onChanged: (value) {
                    cardNote = value;
                  },
                  decoration: InputDecoration(
                    hintText: '備考情報を入力してください',
                  ),
                ),
                Row(
                  children: [
                    Text('アイコンを追加:'),
                    SizedBox(width: 10),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () async {
                        _addIcon((icon) {
                          setState(() {
                            selectedIcons.add(icon);
                          });
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  children: selectedIcons.map((icon) => Icon(icon)).toList(),
                ),
                Row(
                  children: [
                    Text('テンプレート:'),
                    SizedBox(width: 10),
                    TextButton(
                      onPressed: () {
                        _selectCardTemplate((color, icon) {
                          setState(() {
                            selectedColor = color;
                            selectedIcons = [icon];
                          });
                        });
                      },
                      child: Text('選択'),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text('スタンプ:'),
                    SizedBox(width: 10),
                    TextButton(
                      onPressed: () {
                        _customizeStamp((icon, color) {
                          setState(() {
                            stampIcon = icon;
                            stampColor = color;
                          });
                        });
                      },
                      child: Text('カスタマイズ'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('キャンセル'),
            ),
            TextButton(
              child: Text('作成'),
              onPressed: () {
                if (cardName.isNotEmpty) {
                  setState(() {
                    _cards.add(PointCard(
                      cardName: cardName,
                      note: cardNote,
                      color: selectedColor,
                      icons: selectedIcons,
                      maxPoints: maxPoints,
                      backgroundImagePath: backgroundImagePath,
                      stampIcon: stampIcon,
                      stampColor: stampColor,
                    ));
                  });
                  Navigator.of(context).pop();
                }
              },
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

  void _addIcon(Function(IconData) onIconSelected) {
    IconData selectedIcon = Icons.card_giftcard;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('アイコンを追加'),
          content: DropdownButton<IconData>(
            value: selectedIcon,
            items: [
              DropdownMenuItem(
                value: Icons.card_giftcard,
                child: Icon(Icons.card_giftcard),
              ),
              DropdownMenuItem(
                value: Icons.star,
                child: Icon(Icons.star),
              ),
              DropdownMenuItem(
                value: Icons.shopping_cart,
                child: Icon(Icons.shopping_cart),
              ),
            ],
            onChanged: (value) {
              selectedIcon = value!;
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                onIconSelected(selectedIcon);
                Navigator.of(context).pop();
              },
              child: Text('追加'),
            ),
          ],
        );
      },
    );
  }

  void _selectCardTemplate(Function(Color, IconData) onTemplateSelected) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('カードテンプレートを選択'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('シンプル'),
                onTap: () {
                  onTemplateSelected(Colors.white, Icons.credit_card);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: Text('カジュアル'),
                onTap: () {
                  onTemplateSelected(Colors.pink, Icons.thumb_up);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: Text('ビジネス'),
                onTap: () {
                  onTemplateSelected(Colors.grey, Icons.work);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _customizeStamp(Function(IconData, Color) onStampCustomized) {
    IconData selectedIcon = Icons.circle;
    Color selectedColor = Colors.red;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('スタンプをカスタマイズ'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButton<IconData>(
                value: selectedIcon,
                items: [
                  DropdownMenuItem(
                    value: Icons.circle,
                    child: Icon(Icons.circle),
                  ),
                  DropdownMenuItem(
                    value: Icons.star,
                    child: Icon(Icons.star),
                  ),
                  DropdownMenuItem(
                    value: Icons.favorite,
                    child: Icon(Icons.favorite),
                  ),
                ],
                onChanged: (value) {
                  selectedIcon = value!;
                },
              ),
              DropdownButton<Color>(
                value: selectedColor,
                items: [
                  DropdownMenuItem(
                    value: Colors.red,
                    child: Text('Red'),
                  ),
                  DropdownMenuItem(
                    value: Colors.green,
                    child: Text('Green'),
                  ),
                  DropdownMenuItem(
                    value: Colors.blue,
                    child: Text('Blue'),
                  ),
                ],
                onChanged: (value) {
                  selectedColor = value!;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                onStampCustomized(selectedIcon, selectedColor);
                Navigator.of(context).pop();
              },
              child: Text('設定'),
            ),
          ],
        );
      },
    );
  }

  // 戻るボタンを押したとき
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
        title: Text('ポイントカード一覧'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => back(context),
        ),
        actions: [
          IconButton(
            iconSize: 50,
            icon: Icon(Icons.add),
            onPressed: _createNewCard,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _cards.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_cards[index].cardName),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CardDetailsPage(card: _cards[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
