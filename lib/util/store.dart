import 'package:yanomy_github_io/model/post.dart';

class PostStore {
  static final PostStore _instance = PostStore._();

  static PostStore get() => _instance;

  late int _version;
  late Map<String, Post> _posts;

  PostStore._() {
    _version = DateTime.now().millisecondsSinceEpoch;
    _posts = {};
  }

  void putAll(List<Post> posts) {
    _posts.clear();
    for (var post in posts) {
      _posts[post.id] = post;
    }
    _updateVersion();
  }

  List<Post> getAll() {
    return _posts.values.toList();
  }

  Post? operator [](String postId) {
    return _posts[postId];
  }

  _updateVersion() {
    _version = DateTime.now().millisecondsSinceEpoch;
  }

  @override
  bool operator ==(Object other) =>
      (other is PostStore) && (_version == other._version);

  @override
  int get hashCode => Object.hash(_version, _posts);
}
