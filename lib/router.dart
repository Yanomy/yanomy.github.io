import 'package:go_router/go_router.dart';
import 'package:yanomy_github_io/home.dart';
import 'package:yanomy_github_io/model/post.dart';
import 'package:yanomy_github_io/page/post/post-detail-page.dart';

const String _homeLocation = '/';

GoRouter router = GoRouter(initialLocation: _homeLocation, routes: [
  GoRoute(
    path: "/",
    builder: (context, state) => HomePage(),
  ),
  GoRoute(
      path: "/post",
      builder: (context, state) {
        return PostDetailPage(post: state.extra as Post);
      }),
]);
