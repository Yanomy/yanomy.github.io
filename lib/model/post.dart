enum PostCategory {
  redis,
  ;
}

class Post {
  final String title;
  final DateTime createdAt;
  final DateTime updatedAt;

  final List<PostCategory> categories;
  final List<String> tags;

  Post(
      {required this.title,
      required this.createdAt,
      required this.updatedAt,
      this.categories = const [],
      this.tags = const []});
}
