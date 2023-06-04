import 'package:flutter/material.dart';

class Board {
  final String id;
  final String imageDir;
  final String title;
  final String description;

  const Board(
      {required this.id,
      required this.imageDir,
      required this.title,
      required this.description});
}
