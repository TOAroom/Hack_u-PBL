import 'package:flutter/material.dart';

class PointCard {
  final String cardName;
  final String note;
  final Color color;
  final IconData icons;
  final int maxPoints;
  final String? backgroundImagePath;
  final IconData stampIcon; // スタンプアイコン
  final Color stampColor; // スタンプ色

  PointCard({
    required this.cardName,
    required this.note,
    required this.color,
    required this.icons,
    required this.maxPoints,
    this.backgroundImagePath,
    required this.stampIcon,
    required this.stampColor,
  });
}
