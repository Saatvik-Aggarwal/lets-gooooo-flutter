import 'package:flutter/foundation.dart';

class Trail {
  final String name;
  final double length;
  final String description;
  final String difficulty;
  final String thumbnail;
  final double distance;

  Trail(
      {required this.name,
      this.length = 0,
      this.thumbnail = '',
      this.description = '',
      this.difficulty = '',
      this.distance = 0});

  factory Trail.fromJson(Map<String, dynamic> json) {
    print(json['name']);
    return Trail(
        name: json['name'],
        length: json['length'],
        thumbnail: json['thumbnail'],
        description: json['description'],
        difficulty: json['difficulty'],
        distance: json['distance']);
  }
}
