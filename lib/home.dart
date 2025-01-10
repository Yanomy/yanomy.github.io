import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:yanomy_github_io/page/post/post.dart';

const primaryColor = Color(0xFF685BFF);
const canvasColor = Color(0xFF2E2E48);
const scaffoldBackgroundColor = Color(0xFF464667);
const accentCanvasColor = Color(0xFF3E3E61);
const white = Colors.white;
final actionColor = const Color(0xFF5F5FA7).withOpacity(0.6);
final divider = Divider(color: white.withOpacity(0.3), height: 1);

class HomePage extends StatelessWidget {
  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
        key: _key,
        body: Row(
          children: [
            _buildSidebar(context),
            Expanded(
              child: PostList(),
            ),
          ],
        ),
      );
    });
  }

  _buildSidebar(BuildContext context) {
    return SidebarX(
      controller: _controller,
      animationDuration: Duration(milliseconds: 50),
      theme: SidebarXTheme(
        hoverColor: scaffoldBackgroundColor,
        textStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
        selectedTextStyle: const TextStyle(color: Colors.white),
        hoverTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        decoration: BoxDecoration(
          color: canvasColor,
        ),
        itemTextPadding: const EdgeInsets.only(left: 30),
        selectedItemTextPadding: const EdgeInsets.only(left: 30),
        selectedItemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: actionColor.withOpacity(0.37),
          ),
          gradient: const LinearGradient(
            colors: [accentCanvasColor, canvasColor],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.28),
              blurRadius: 30,
            )
          ],
        ),
        iconTheme: IconThemeData(
          color: Colors.white.withOpacity(0.7),
          size: 20,
        ),
        selectedIconTheme: const IconThemeData(
          color: Colors.white,
          size: 20,
        ),
      ),
      extendedTheme: const SidebarXTheme(
        width: 200,
        decoration: BoxDecoration(
          color: canvasColor,
        ),
      ),
      footerDivider: divider,
      headerBuilder: (context, extended) {
        return SizedBox(
          height: 100,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset('assets/images/avatar.png'),
          ),
        );
      },
      items: [
        SidebarXItem(
          iconBuilder: _iconBuilder(Icons.home, Icons.home_outlined),
          icon: Icons.home,
          label: 'Home',
          onTap: () => context.goNamed('home'),
        ),
        SidebarXItem(
          iconBuilder: _iconBuilder(Icons.article, Icons.article_outlined),
          label: 'Posts',
        ),
        SidebarXItem(
          iconBuilder:
              _iconBuilder(Icons.account_box, Icons.account_box_outlined),
          label: 'Me',
          onTap: () => context.goNamed('me'),
        ),
      ],
    );
  }

  SidebarXItemBuilder _iconBuilder(IconData icon, IconData selectedIcon) {
    return (selected, hovered) => selected
        ? Icon(selectedIcon, color: Colors.white, size: 20)
        : Icon(
            icon,
            color: Colors.white.withAlpha(178),
            size: 20,
          );
  }
}
