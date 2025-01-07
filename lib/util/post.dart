import 'package:flutter/services.dart';

class PostUtil {
  PostUtil._();

  static allPosts() async {
    AssetManifest manifest =
        await AssetManifest.loadFromAssetBundle(rootBundle);
    List<String> assets =
        manifest.listAssets().where((a) => a.startsWith("posts/")).toList();
    for (var a in assets) {
      String contents = await rootBundle.loadString(a);
      print('Load from $a\n $contents');
    }
  }
}
