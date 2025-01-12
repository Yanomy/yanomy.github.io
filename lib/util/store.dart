import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:yanomy_github_io/model/post.dart';

class PostStore {
  static late PostStore _instance;

  static PostStore get() => _instance;

   int _version;
  final SharedPreferences _posts;

  static init() async{
    var prefs = await SharedPreferences.getInstance();
    _instance = PostStore._(prefs);
  }

  PostStore._(this._posts) : _version = DateTime.now().millisecondsSinceEpoch;

  void putAll(List<Post> posts) async {
    _posts.clear();
    for (var post in posts) {
      _posts.setString(post.id, jsonEncode(post.toJson()));
    }
    _updateVersion();
  }

  List<Post> getAll() {
    return _posts
        .getKeys()
        .map((key) => Post.fromJson(jsonDecode(_posts.getString(key)!)))
        .toList();
  }

  Post? operator [](String postId) {
    var value = _posts.getString(postId);
    if (value == null) return null;
    return Post.fromJson(jsonDecode(value));
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
