import 'package:flutter/material.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:yanomy_github_io/widget/markdown/html-tags.dart';
import 'package:yanomy_github_io/widget/styles.dart' as style;

List<Widget> buildNodes(BuildContext context, List<md.Node> nodes) {
  List<Widget> widgets = [];
  for (md.Node node in nodes) {
    if (node is md.Element) {
      widgets.add(_parseTopLevelNode(context, node));
    } else {
      throw Exception("Unable to handle node type: ${node.runtimeType}");
    }
  }
  return widgets;
}

Widget _parseTopLevelNode(BuildContext context, md.Node node) {
  if (node is md.Element) {
    HtmlTag tag = HtmlTag.of(node.tag);
    return _parseElement(context, node, tag.style(context));
  } else if (node is md.Text) {
    return Text.rich(_parseText(context, node));
  } else if (node is md.UnparsedContent) {
    return Text.rich(_parseUnparsedContent(context, node));
  } else {
    throw Exception("Unable to handle node type: ${node.runtimeType}");
  }
}

Widget _parseElement(BuildContext context, md.Element element,
    [TextStyle? parentStyle]) {
  HtmlTag tag = HtmlTag.of(element.tag);
  List<TextSpan> children = [];
  if (element.children != null) {
    for (md.Node child in element.children!) {
      children
          .addAll(_parseNode(context, child, tag.style(context, parentStyle)));
    }
  }
  return tag.decorate(context, children);
}

List<TextSpan> _parseNode(BuildContext context, md.Node node,
    [TextStyle? parentStyle]) {
  if (node is md.Element) {
    return _parseElementInline(context, node, parentStyle);
  } else if (node is md.Text) {
    return [_parseText(context, node, parentStyle)];
  } else if (node is md.UnparsedContent) {
    return [_parseUnparsedContent(context, node, parentStyle)];
  } else {
    throw Exception("Unable to handle node type: ${node.runtimeType}");
  }
}

TextSpan _parseText(BuildContext context, md.Text node,
    [TextStyle? parentStyle]) {
  return TextSpan(text: node.textContent, style: parentStyle);
}

TextSpan _parseUnparsedContent(BuildContext context, md.UnparsedContent node,
    [TextStyle? parentStyle]) {
  return TextSpan(
      text: node.textContent,
      style: style.unparsedContent(context, parentStyle));
}

List<TextSpan> _parseElementInline(BuildContext context, md.Element element,
    [TextStyle? parentStyle]) {
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
