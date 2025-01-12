import 'dart:math';

import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

enum PostCategory {
  redis,
  career,
  accounting,
  algorithm,
  ;

  factory PostCategory.of(String value) {
    for (PostCategory c in values) {
      if (c.name.toLowerCase() == value.toLowerCase()) return c;
    }
    throw Exception("Unknown $PostCategory value: $value");
  }
}

@JsonSerializable(explicitToJson: true)
class Post {
  final String title;
  final DateTime createdAt;

  final List<PostCategory> categories;
  final List<String> tags;

  String contents = '';

  Post(
      {required this.title,
      required this.createdAt,
      this.categories = const [],
      this.tags = const []});

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);

  String get id => "${createdAt.millisecondsSinceEpoch / 1000}";

  String get summary {
    String summary = contents
        .substring(0, min(contents.length, 300))
        .replaceAll("\n", "")
        .replaceAll('#', '');
    return "$summary...";
  }
}
