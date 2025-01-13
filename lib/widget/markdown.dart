import 'package:flutter/material.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:yanomy_github_io/widget/markdown/html-tags.dart';
import 'package:yanomy_github_io/widget/styles.dart' as style;

List<Widget> buildNodes(BuildContext context, List<md.Node> nodes) {
  List<Widget> widgets = [];
  for (md.Node node in nodes) {
    if (node is md.Element) {
      widgets.add(_parseElement(context, node));
    } else {
      throw Exception("Unable to handle node type: ${node.runtimeType}");
    }
  }
  return widgets;
}

Widget _parseElement(BuildContext context, md.Element element) {
  HtmlTag tag = HtmlTag.of(element.tag);
  List<TextSpan> children = [];
  if (element.children != null) {
    for (md.Node child in element.children!) {
      children.addAll(_parseNode(context, child, tag.style(context)));
    }
  }
  return tag.decorate(context, children);
}

List<TextSpan> _parseNode(
    BuildContext context, md.Node node, TextStyle parentStyle,
    [bool escape = true]) {
  if (node is md.Element) {
    return _parseElementInline(context, node, parentStyle);
  } else if (node is md.Text) {
    return [TextSpan(text: node.textContent, style: parentStyle)];
  } else if (node is md.UnparsedContent) {
    return [
      TextSpan(text: node.textContent, style: style.unparsedContent(context))
    ];
  } else {
    throw Exception("Unable to handle node type: ${node.runtimeType}");
  }
}

List<TextSpan> _parseElementInline(
    BuildContext context, md.Element element, TextStyle parentStyle) {
  List<TextSpan> children = [];
  HtmlTag tag = HtmlTag.of(element.tag);
  if (element.children != null) {
    for (md.Node child in element.children!) {
      children.addAll(_parseNode(
        context,
        child,
        tag.style(context, parentStyle),
      ));
    }
  }

  return tag.decorateInline(
      context, children, children.isEmpty ? element.textContent : null);
}
