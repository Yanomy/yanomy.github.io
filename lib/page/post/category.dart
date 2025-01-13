import 'package:flutter/material.dart';
import 'package:yanomic_github_io/model/post.dart';

class Category extends StatelessWidget {
  final PostCategory category;

  const Category({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black54, width: 1.5),
          borderRadius: BorderRadius.circular(5)),
      clipBehavior: Clip.hardEdge,
      child: Text(
        category.name,
        style: Theme.of(context)
            .textTheme
            .labelSmall
            ?.copyWith(fontWeight: FontWeight.bold, color: Colors.black54),
      ),
    );
  }
}
