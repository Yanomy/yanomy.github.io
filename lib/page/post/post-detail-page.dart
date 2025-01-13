import 'package:flutter/material.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:yanomic_github_io/model/post.dart';
import 'package:yanomic_github_io/widget/markdown.dart';

class PostDetailPage extends StatelessWidget {
  final Post post;

  const PostDetailPage({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    List<md.Node> nodes = md.Document().parse(post.contents);
    return Scaffold(
      body: SelectionArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            Expanded(
                child: ListView(children: buildNodes(context, nodes))),
          ],
        ),
      ),
    );
  }
}
