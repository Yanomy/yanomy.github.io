import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:yanomy_github_io/model/post.dart';

class PostDetailPage extends StatelessWidget {
  final Post post;

  const PostDetailPage({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SelectionArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 32, 0, 0),
              child: Row(
                children: [
                  Text(post.title,
                      style: Theme.of(context).textTheme.displayLarge),
                ],
              ),
            ),
            Expanded(child: Markdown(data: post.contents)),
          ],
        ),
      ),
    );
  }
}
