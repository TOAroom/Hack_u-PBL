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
    Color selectedColor = Colors.white;
    IconData selectedIcons = Icons.card_giftcard;
    IconData templateIcons = Icons.credit_card;
    int maxPoints = 20;
    String? backgroundImagePath;
    IconData stampIcon = Icons.circle;
    Color stampColor = Colors.red;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (BuildContext, StateSetter setState) {
          IconData ischecked = selectedIcons;

          return AlertDialog(
            title: Text('ポイントカードを作成'),
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
                      Text('アイコン:     '),
                      SizedBox(width: 10),
                      ElevatedButton(
                        child: Text('選択'),
                        onPressed: () async {
                          _addIcon((icon) {
                            setState(() {
                              selectedIcons = icon;
                            });
                          });
                        },
                      ),
                    ],
                  ),
                  Row(children: [
                    Text('          選択中:    '),
                    Icon(selectedIcons),
                  ]),
                  Row(
                    children: [
                      Text('テンプレート:'),
                      SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                          _selectCardTemplate((color, icon) {
                            setState(() {
                              selectedColor = color;
                              templateIcons = icon;
                            });
                          });
                        },
                        child: Text('選択'),
                      ),
                    ],
                  ),
                  Column(children: [
                    Row(children: [
                      Text('          選択中:'),
                      Icon(templateIcons),
                      show_template(selectedColor),
                    ]),
                    Container(
                      height: 50,
                      width: 75,
                      decoration: BoxDecoration(
                        color: selectedColor,
                        border: Border.all(color: Colors.black, width: 0.1),
                      ),
                    ),
                  ]),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text('スタンプ: '),
                          SizedBox(width: 10),
                          ElevatedButton(
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
                      Row(children: [
                        Text('          選択中:     '),
                        Icon(stampIcon, color: stampColor),
                      ])
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
                child: Text('プレビュー表示'),
                onPressed: () {
                  previewNewCard(
                      cardName,
                      cardNote,
                      selectedColor,
                      selectedIcons,
                      templateIcons,
                      maxPoints,
                      backgroundImagePath,
                      stampIcon,
                      stampColor);
                },
              ),
            ],
          );
        });
      },
    );
  }

  void previewNewCard(
      String cardName,
      String cardNote,
      Color selectedColor,
      IconData selectedIcons,
      IconData templateIcons,
      int maxPoints,
      String? backgroundImagePath,
      IconData stampIcon,
      Color stampColor) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('ポイントカードプレビュ'),
            content: SingleChildScrollView(
              child: Column(children: [
                Container(
                  padding: EdgeInsets.only(bottom: 70, right: 110),
                  height: 100,
                  width: 150,
                  decoration: BoxDecoration(
                    color: selectedColor,
                    border: Border.all(color: Colors.black, width: 0.1),
                  ),
                  child: Icon(stampIcon, color: stampColor),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                          Navigator.of(context).pop();
                        }
                      },
                    ),
                  ],
                ),
              ]),
            ),
          );
        });
  }

  Text show_template(Color selectedColor) {
    if (selectedColor.value == Colors.white.value) {
      return Text('シンプル');
    } else if (selectedColor.value == Colors.pink.value) {
      return Text('カジュアル');
    } else if (selectedColor.value == Colors.grey.value) {
      return Text('ビジネス');
    }
    return Text('何も選択していません');
  }

  void _viewCardDetails(PointCard card) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CardDetailsPage(card: card)),
    );
  }

  void _addIcon(Function(IconData) onIconSelected) {
    IconData selectIcon = Icons.card_giftcard;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext, StateSetter setState) {
            IconData ischecked = selectIcon;

            return AlertDialog(
              title: Text('アイコンを追加'),
              content: DropdownButton<IconData>(
                value: ischecked,
                onChanged: (IconData? value) {
                  setState(() {
                    ischecked = (value ?? ischecked);
                    selectIcon = ischecked; // selectIconにも反映させる
                  });
                },
                items: const [
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
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text('選択中のアイコン: '),
                        Icon(ischecked), // ischeckedに変更
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        onIconSelected(selectIcon);
                        Navigator.of(context).pop();
                      },
                      child: Text('追加'),
                    ),
                  ],
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _selectCardTemplate(Function(Color, IconData) onTemplateSelected) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('カードテンプレートを選択'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: Text('シンプル'),
                  leading: Icon(Icons.credit_card),
                  onTap: () {
                    onTemplateSelected(Colors.white, Icons.credit_card);
                    Navigator.of(context).pop();
                  },
                ),
                Container(
                  height: 50,
                  width: 75,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 0.1),
                  ),
                ),
                ListTile(
                  title: Text('カジュアル'),
                  leading: Icon(Icons.thumb_up),
                  onTap: () {
                    onTemplateSelected(Colors.pink, Icons.thumb_up);
                    Navigator.of(context).pop();
                  },
                ),
                Container(
                  height: 50,
                  width: 75,
                  decoration: const BoxDecoration(color: Colors.pink),
                ),
                ListTile(
                  title: Text('ビジネス'),
                  leading: Icon(Icons.work),
                  onTap: () {
                    onTemplateSelected(Colors.grey, Icons.work);
                    Navigator.of(context).pop();
                  },
                ),
                Container(
                  height: 50,
                  width: 75,
                  decoration: const BoxDecoration(color: Colors.grey),
                ),
              ],
            ),
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
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext, StateSetter setState) {
            IconData iconIschecked = selectedIcon;
            Color colorIschecked = selectedColor;

            return AlertDialog(
              title: const Text('スタンプをカスタマイズ'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DropdownButton<IconData>(
                    value: iconIschecked,
                    onChanged: (IconData? value) {
                      setState(() {
                        iconIschecked = (value ?? iconIschecked);
                        selectedIcon = iconIschecked;
                      });
                    },
                    items: const [
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
                  ),
                  DropdownButton<Color>(
                    value: colorIschecked,
                    onChanged: (Color? value) {
                      setState(() {
                        colorIschecked = (value ?? colorIschecked);
                        selectedColor = colorIschecked;
                      });
                    },
                    items: const [
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
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text('カスタマイズしたスタンプ'),
                          Icon(
                            selectedIcon,
                            color: selectedColor,
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    onStampCustomized(selectedIcon, selectedColor);
                    Navigator.of(context).pop();
                  },
                  child: const Text('設定'),
                ),
              ],
            );
          },
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
    return Scaffold(
      //Appbarの設定
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 94, 199, 73),
        title: const Text('ポイントカード一覧', style: TextStyle(color: Colors.white)),
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
        centerTitle: true,
      ),

      //カードをリスト表示
      body: ListView.builder(
        itemCount: _cards.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(_cards[index].icons, color: Colors.black),
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
