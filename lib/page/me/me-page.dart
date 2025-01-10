import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yanomy_github_io/page/me/profile-image.dart';

class MePage extends StatelessWidget {
  const MePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(height: 56, child: _builderHeader(context)),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(flex: 382, child: _buildProfileCol(context)),
                Flexible(flex: 618, child: _buildResumeCol(context)),
              ],
            ),
          ),
          SizedBox(height: 40, child: _builderFooter(context)),
        ],
      ),
    );
  }

  Widget _builderHeader(BuildContext context) {
    return Container(color: Colors.amber);
  }

  Widget _buildProfileCol(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 350, minWidth: 250),
      color: Colors.blue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            constraints: BoxConstraints(minWidth: 300),
            margin: EdgeInsets.all(32),
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(10)),
            child: ProfilePhoto(),
          ),
          Expanded(child: _buildInfo(context))
        ],
      ),
    );
  }

  Widget _buildResumeCol(BuildContext context) {
    return Container(color: Colors.black12);
  }

  Widget _builderFooter(BuildContext context) {
    return Container(color: Theme.of(context).hintColor);
  }

  Widget _buildInfo(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 56),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
              flex: 500,
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
              flex: 500,
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
            style: GoogleFonts.quantico(decoration: TextDecoration.underline, fontSize: 14),
          ),
        ),
      ),
    );
  }
}
