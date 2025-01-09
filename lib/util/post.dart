import 'package:yaml/yaml.dart';
import 'package:yanomy_github_io/model/post.dart';
import 'package:yanomy_github_io/util/pair.dart';

class PostUtil {
  static RegExp sectionBoundary = RegExp(r'---\n');

  PostUtil._();

  static Post fromAsset(String data) {
    List<String> sections = data.split(sectionBoundary);

    Post post = _fromMetadata(sections[1]);
    String contents = sections.sublist(2).join("\n");
    return post..contents = contents.trim();
  }

  static Post _fromMetadata(String metadataSection) {
    return PostBuilder.fromMetadata(metadataSection).build();
  }
}

enum PostMetadata {
  title,
  createdAt,
  categories,
  tags,
  ;

  dynamic parseValue(dynamic value) {
    switch (this) {
      case title:
        {
          if (value is! String) {
            throw Exception(
                "Expect $String for $this, but get ${value?.runtimeType}");
          }
          return value;
        }
      case createdAt:
        {
          if (value is! String) {
            throw Exception("Can not parse DateTime from ${value.runtimeType}");
          }
          var val = DateTime.tryParse(value);
          if (val == null) {
            throw Exception("Invalid value for $this: $value");
          }
          return val;
        }
      case categories:
        {
          if (value is! YamlList) {
            throw Exception(
                "Expect $YamlList for $this, but get ${value?.runtimeType}");
          }
          return value.map((v) => PostCategory.of(v)).toList();
        }
      case tags:
        if (value is! YamlList) {
          throw Exception(
              "Expect $YamlList for $this, but get ${value?.runtimeType}");
        }
        return value.map((t) => t.toString()).toList();
    }
  }
}

class PostBuilder {
  final Map<PostMetadata, dynamic> _metadata = {};

  PostBuilder._();

  factory PostBuilder.fromMetadata(String metadataSection) {
    PostBuilder builder = PostBuilder._();
    YamlMap json = loadYaml(metadataSection);

    for (var metadata in PostMetadata.values) {
      var value = json[metadata.name];
      builder._metadata[metadata] = metadata.parseValue(value);
    }

    var notMetadata = [...PostMetadata.values]
      ..removeWhere((f) => json.keys.contains(f.name));
    if (notMetadata.isNotEmpty) {
      print("Unrecognized metadata fields: $notMetadata");
    }

    return builder;
  }

  Post build() {
    return Post(
        title: _metadata[PostMetadata.title] as String,
        createdAt: _metadata[PostMetadata.createdAt] as DateTime,
        categories: _metadata[PostMetadata.categories] as List<PostCategory>,
        tags: _metadata[PostMetadata.tags] as List<String>);
  }
}
