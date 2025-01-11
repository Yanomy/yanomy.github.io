import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yanomy_github_io/page/me/profile-image.dart';
import 'package:yanomy_github_io/page/me/resume.dart';

class MePage extends StatelessWidget {
  const MePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(flex: 382, child: _buildProfileCol(context)),
                SizedBox(width: 32),
                Flexible(
                    flex: 618,
                    child: Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Resume(),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileCol(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 250, minWidth: 200),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(16, 32, 16, 48),
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: ProfilePhoto(),
          ),
          Expanded(child: _buildInfo(context))
        ],
      ),
    );
  }

  Widget _buildInfo(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 56),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
              flex: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(Icons.apartment, size: 20),
                  Icon(Icons.location_on, size: 20),
                  Container(
                      margin: EdgeInsets.all(2),
                      width: 16,
                      child: Image.asset('assets/icons/github.png',
                          fit: BoxFit.contain)),
                  Container(
                      margin: EdgeInsets.all(2),
                      width: 16,
                      child: Image.asset('assets/icons/linkedin.png',
                          fit: BoxFit.contain))
                ],
              )),
          SizedBox(width: 24),
          Flexible(
              flex: 600,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInfoEntry(context, "Adyen", "https://www.adyen.com/"),
                  _buildInfoEntry(context, "Singapore",
                      "https://maps.app.goo.gl/sGkv9m2X8AMgLG2g6"),
                  _buildInfoEntry(
                      context, "GitHub", "https://github.com/yan-hai"),
                  _buildInfoEntry(context, "LinkedIn",
                      "https://www.linkedin.com/in/yan-hai-a87105134/"),
                ],
              ))
        ],
      ),
    );
  }

  Widget _buildInfoEntry(BuildContext context, String text, String link) {
    return SizedBox(
      height: 20,
      child: Align(
        alignment: Alignment.centerLeft,
        child: InkWell(
          onTap: () =>
              launchUrl(Uri.parse(link), mode: LaunchMode.platformDefault),
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                decoration: TextDecoration.underline),
          ),
        ),
      ),
    );
  }
}
