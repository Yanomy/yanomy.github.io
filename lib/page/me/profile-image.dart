import 'package:flutter/cupertino.dart';

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double maxWidth = constraints.maxWidth;
      return SizedBox(
        height: maxWidth / 3 * 4,
        width: maxWidth,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Image.asset('assets/images/avatar.png', fit: BoxFit.cover),
        ),
      );
    });
  }
}
