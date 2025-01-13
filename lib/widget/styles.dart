import 'package:flutter/material.dart';

TextStyle bodyText(BuildContext context, [TextStyle? inherit]) =>
    Theme.of(context).textTheme.bodyMedium!.copyWith(height: 1.15);

TextStyle unparsedContent(BuildContext context, [TextStyle? inherit]) =>
    (inherit ?? bodyText(context))
        .copyWith(decorationStyle: TextDecorationStyle.wavy);

TextStyle h1Text(BuildContext context, [TextStyle? inherit]) =>
    Theme.of(context).textTheme.displayLarge!;

TextStyle h2Text(BuildContext context, [TextStyle? inherit]) =>
    Theme.of(context).textTheme.displayMedium!;

TextStyle h3Text(BuildContext context, [TextStyle? inherit]) =>
    Theme.of(context).textTheme.displaySmall!;

TextStyle h4Text(BuildContext context, [TextStyle? inherit]) =>
    Theme.of(context).textTheme.headlineLarge!;

TextStyle h5Text(BuildContext context, [TextStyle? inherit]) =>
    Theme.of(context).textTheme.headlineMedium!;

TextStyle h6Text(BuildContext context, [TextStyle? inherit]) =>
    Theme.of(context).textTheme.headlineSmall!;

TextStyle strongText(BuildContext context, [TextStyle? inherit]) =>
    (inherit ?? Theme.of(context).textTheme.bodyMedium!)
        .copyWith(backgroundColor: Colors.redAccent);
