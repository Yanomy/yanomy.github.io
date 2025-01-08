import 'package:yanomy_github_io/model/post.dart';
import 'package:yanomy_github_io/util/pair.dart';

class PostUtil {
  static RegExp sectionBoundary = RegExp(r'^---$');

  PostUtil._();

  static Post fromAsset(String data) {
    List<String> sections = data.split(sectionBoundary);

    Post post = _fromMetadata(sections[0]);
    String contents = sections.sublist(1).join("\n");
    return post..contents = contents;
  }

  static Post _fromMetadata(String metadataSection) {
    return PostBuilder.fromMetadata(metadataSection).build();
  }
}

enum PostMetadata {
  title(isRequired: true),
  createdAt(isRequired: true),
  categories(isRequired: true),
  tags(isRequired: false),
  ;

  final bool isRequired;

  static final RegExp _titleRegExp = RegExp(r'^title:(.)+');
  static final RegExp _createdAtRegExp = RegExp(r'^createdAt:(.)+');
  static final RegExp _categories = RegExp(r'^title:(.)+');
  static final RegExp _tags = RegExp(r'^title:(.)+');

  const PostMetadata({required this.isRequired});

  static Pair<PostMetadata, String?> matches(String line) {
    for (var metadata in values) {
      RegExpMatch? match = metadata._regExp.firstMatch(line);
      if (match == null) continue;
      return Pair(metadata, match.group(0));
    }
    throw Exception("Unknown metadata: $line");
  }

  RegExp get _regExp {
    return switch (this) {
      title => _titleRegExp,
      createdAt => _createdAtRegExp,
      categories => _categories,
      tags => _tags,
    };
  }

  validate(String? value) {
    if (isRequired && (value?.isEmpty ?? true)) {
      throw Exception("Required metadata: $name is missing");
    }
    switch (this) {
      case title:
      case tags:
        break;
      case createdAt:
        {
          var val = DateTime.tryParse(value!);
          if (val == null) {
            throw Exception("Invalid value for $name: $value");
          }
          break;
        }
      case categories:
        {
          List<PostCategory>? list = value
              ?.split(',')
              .map((c) => c.trim())
              .where((c) => c.isNotEmpty)
              .map((c) => PostCategory.of(c))
              .toList();
          if (list == null || list.isEmpty) {
            throw Exception("$name can not be empty");
          }

          break;
        }
    }
  }
}

class PostBuilder {
  final Map<PostMetadata, String?> _metadata = {};

  PostBuilder._();

  factory PostBuilder.fromMetadata(String metadataSection) {
    PostBuilder builder = PostBuilder._();
    List<String> lines = metadataSection.split("\n");
    for (String line in lines) {
      Pair<PostMetadata, String?> pair = PostMetadata.matches(line);
      builder._metadata[pair.key] = pair.value?.trim();
    }
    return builder;
  }

  Post build() {
    _validate();
    return Post(
        title: _metadata[PostMetadata.title]!,
        createdAt: DateTime.tryParse(_metadata[PostMetadata.createdAt]!)!,
        categories: (_metadata[PostMetadata.categories]
            ?.split(',')
            .map((c) => c.trim())
            .where((c) => c.isNotEmpty)
            .map((c) => PostCategory.of(c))
            .toList())!,
        tags: _metadata[PostMetadata.tags]
                ?.split(',')
                .map((c) => c.trim())
                .where((c) => c.isNotEmpty)
                .toList() ??
            []);
  }

  _validate() {
    for (PostMetadata key in PostMetadata.values) {
      String? value = _metadata[key];
      key.validate(value);
    }
  }
}
