// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      title: json['title'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      categories: (json['categories'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$PostCategoryEnumMap, e))
              .toList() ??
          const [],
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
    )..contents = json['contents'] as String;

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'title': instance.title,
      'createdAt': instance.createdAt.toIso8601String(),
      'categories':
          instance.categories.map((e) => _$PostCategoryEnumMap[e]!).toList(),
      'tags': instance.tags,
      'contents': instance.contents,
    };

const _$PostCategoryEnumMap = {
  PostCategory.redis: 'redis',
  PostCategory.career: 'career',
  PostCategory.accounting: 'accounting',
  PostCategory.algorithm: 'algorithm',
};
