import 'package:flutter/cupertino.dart';
import 'package:yanomy_github_io/widget/styles.dart';

enum HtmlTag {
  address,
  article,
  aside,
  blockquote,
  code,
  dd,
  details,
  div,
  dl,
  dt,
  figcaption,
  figure,
  footer,
  h1,
  h2,
  h3,
  h4,
  h5,
  h6,
  header,
  hgroup,
  hr,
  li,
  main,
  nav,
  ol,
  p,
  pre,
  section,
  strong,
  table,
  tbody,
  td,
  th,
  thead,
  tr,
  ul(isMultiLine: true),
  ;

  final bool isMultiLine;

  const HtmlTag({this.isMultiLine = false});

  static HtmlTag of(String tag) {
    for (var t in values) {
      if (t.name.toLowerCase() == tag.toLowerCase()) {
        return t;
      }
    }
    throw Exception("Unknown HTML tag: $tag");
  }

  Widget decorate(BuildContext context, List<TextSpan> children) {
    var row = Text.rich(TextSpan(text: "", children: decorateInline(context, children)));
    return switch (this) {
      p => Padding(
          padding: EdgeInsets.symmetric(vertical: 4),
          child: row,
        ),
      h1 => Padding(
          padding: EdgeInsets.symmetric(vertical: 24),
          child: row,
        ),
      h2 => Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: row,
        ),
      h3 => Padding(
          padding: EdgeInsets.symmetric(vertical: 12),
          child: row,
        ),
      h4 => Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: row,
        ),
      h5 => Padding(
          padding: EdgeInsets.symmetric(vertical: 6),
          child: row,
        ),
      h6 => Padding(
          padding: EdgeInsets.symmetric(vertical: 4),
          child: row,
        ),
      _ => row,
    };
  }

  List<TextSpan> decorateInline(BuildContext context, List<TextSpan> children,
      [String? text]) {
    if (text == null) return children;
    return [TextSpan(text: text, style: style(context))];
  }

  TextStyle style(BuildContext context, [TextStyle? inherit]) => switch (this) {
        h1 => h1Text(context, inherit),
        h2 => h2Text(context, inherit),
        h3 => h3Text(context, inherit),
        h4 => h4Text(context, inherit),
        h5 => h5Text(context, inherit),
        h6 => h6Text(context, inherit),
        strong => strongText(context, inherit),
        p => bodyText(context, inherit),
        _ => unparsedContent(context, inherit)
      };
}
