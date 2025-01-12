import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:yanomy_github_io/home.dart';
import 'package:yanomy_github_io/page/me/me-page.dart';
import 'package:yanomy_github_io/page/post/post-detail-page.dart';
import 'package:yanomy_github_io/util/store.dart';

import 'model/post.dart';

const String _homeLocation = '/home';

GoRouter router = GoRouter(
    initialLocation: _homeLocation,
    errorBuilder: (context, state) =>
        Center(child: Text("${state.uri} not found")),
    routes: [
      GoRoute(
        name: 'home',
        path: "/home",
        builder: (context, state) => HomePage(),
      ),
      GoRoute(
          name: 'post',
          path: "/post/:id",
          builder: (context, state) {
            String postId = state.pathParameters['id']!;
            Post? post = PostStore.get()[postId];
            if (post == null) {
              throw Exception("${state.uri} not found");
            }
            return PostDetailPage(post: post);
          }),
      GoRoute(name: 'me', path: "/", builder: (context, state) => MePage()),
    ]);
