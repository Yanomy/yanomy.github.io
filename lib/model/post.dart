import 'package:yanomy_github_io/util/pair.dart';

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
}
