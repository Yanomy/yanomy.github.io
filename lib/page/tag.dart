import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  final String tag;

  const Tag({super.key, required this.tag});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      decoration: BoxDecoration(
        color: Theme.of(context).hoverColor,
        borderRadius: BorderRadius.circular(5),
      ),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () => print('tapped tag $tag'),
        child: Text("#$tag"),
      ),
    );
  }
}
