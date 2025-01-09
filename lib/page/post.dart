import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yanomy_github_io/model/post.dart';
import 'package:yanomy_github_io/page/category.dart';
import 'package:yanomy_github_io/page/tag.dart';
import 'package:yanomy_github_io/util/assets.dart';
import 'package:yanomy_github_io/util/datetime.dart';

class PostList extends StatefulWidget {
  const PostList({super.key});

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Post>>(
        future: AssetsUtil.allPosts(),
        builder: (context, snapshot) {
          if (ConnectionState.done != snapshot.connectionState) {
            return CircularProgressIndicator.adaptive();
          }
          if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error}"));
          }
          return _buildPosts(snapshot.data as List<Post>);
        });
  }

  _buildPosts(List<Post> posts) {
    return ListView.separated(
        shrinkWrap: true,
        itemCount: posts.length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, index) => PostTile(post: posts[index]));
  }
}

class PostTile extends StatelessWidget {
  final Post post;

  const PostTile({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _goPostDetailPage(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(DatetimeUtil.formatDatetime(post.createdAt),
              style: Theme
                  .of(context)
                  .textTheme
                  .bodySmall),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(post.title,
                  style: Theme
                      .of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold)),
              if (post.categories.isNotEmpty) ..._buildCategories(
                  post.categories)
            ],
          ),
          if (post.tags.isNotEmpty)
            Padding(
                padding: EdgeInsets.only(top: 4),
                child: _buildTagList(post.tags)),
          if (post.contents.isNotEmpty)
            Padding(
                padding: EdgeInsets.only(top: 12),
                child: _buildSummary(context, post)),
        ],
      ),
    );
  }

  _buildCategories(List<PostCategory> categories) {
    List<Widget> widgets = categories
        .map((c) =>
        Padding(
            padding: EdgeInsets.only(left: 4),
            child: Category(
              category: c,
            )))
        .toList();
    return widgets;
  }

  _buildTagList(List<String> tags) {
    List<Widget> widgets = tags
        .map((t) =>
        Tag(
          tag: t,
        ))
        .toList();
    List<Widget> joined = [];
    for (var i = 0; i < widgets.length; i++) {
      if (i != widgets.length - 1) {
        joined.add(widgets[i]);
        joined.add(Padding(
            padding: EdgeInsets.fromLTRB(1, 0, 6, 0), child: Text(",")));
      } else {
        joined.add(widgets[i]);
      }
    }
    return Row(
      children: joined,
    );
  }

  _buildSummary(BuildContext context, Post post) {
    return SelectionArea(
      child: Text(
        post.summary,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: Theme
            .of(context)
            .textTheme
            .bodySmall
            ?.copyWith(color: Theme
            .of(context)
            .colorScheme
            .secondary),
      ),
    );
  }

  _goPostDetailPage(BuildContext context) {
    context.push('/post', extra: post);
  }
}
