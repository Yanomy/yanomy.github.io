import 'package:flutter/services.dart';
import 'package:yanomy_github_io/model/post.dart';
import 'package:yanomy_github_io/util/post.dart';
import 'package:yanomy_github_io/util/store.dart';

class AssetsUtil {
  AssetsUtil._();

  static Future<void> loadPosts() async {
    AssetManifest manifest =
        await AssetManifest.loadFromAssetBundle(rootBundle);
    List<String> assets = manifest
        .listAssets()
        .where((a) => a.startsWith("assets/posts/"))
        .toList();
    List<Post> posts = [];
    for (var a in assets) {
      String data = await rootBundle.loadString(a);
      posts.add(PostUtil.fromAsset(data));
    }
    PostStore.get().putAll(posts);
  }
}
