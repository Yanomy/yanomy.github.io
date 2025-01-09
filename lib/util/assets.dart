import 'package:flutter/services.dart';
import 'package:yanomy_github_io/model/post.dart';
import 'package:yanomy_github_io/util/post.dart';

class AssetsUtil {
  AssetsUtil._();

  static Future<List<Post>> allPosts() async {
    AssetManifest manifest =
        await AssetManifest.loadFromAssetBundle(rootBundle);
    List<String> assets =
        manifest.listAssets().where((a) => a.startsWith("posts/")).toList();
    List<Post> posts = [];
    for (var a in assets) {
      String data = await rootBundle.loadString(a);
      posts.add(PostUtil.fromAsset(data));
    }
    return posts;
  }
}
