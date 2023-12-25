import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String title;
  final FontWeight? fontWeight;
  final Color? color;
  final double? fontSize;
  final TextAlign? align;
  final TextDecoration? decoration;
  final TextOverflow? overflow;
  final int? maxLines;
  final bool? softWrap;
  final double? height;
  final String? fontFamily;

  const AppText({
    Key? key,
    required this.title,
    this.color,
    this.fontSize,
    this.height,
    this.fontWeight,
    this.align,
    this.decoration,
    this.overflow,
    this.maxLines,
    this.fontFamily,
    this.softWrap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: align ?? TextAlign.start,
      textScaler: TextScaler.linear(1),
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        height: height,
        decoration: decoration ?? TextDecoration.none,
        fontWeight: fontWeight,
      ),
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
    );
  }
}
