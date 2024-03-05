import 'package:flutter/material.dart';
import 'package:neodocs_assignment/core/globals/size_config.dart';

// Constants to style the text easily
class MyFonts {
  static const String _fontFamily = 'OpenSans';

  static TextStyle get light =>
      const TextStyle(fontFamily: _fontFamily, fontWeight: FontWeight.w400);
  static TextStyle get medium =>
      const TextStyle(fontFamily: _fontFamily, fontWeight: FontWeight.w600);
  static TextStyle get extraBold =>
      const TextStyle(fontFamily: _fontFamily, fontWeight: FontWeight.w900);
  static TextStyle get bold =>
      const TextStyle(fontFamily: _fontFamily, fontWeight: FontWeight.w800);
  static TextStyle get semiBold =>
      const TextStyle(fontFamily: _fontFamily, fontWeight: FontWeight.w700);
}

extension TextStyleHelpers on TextStyle {
  TextStyle setColor(Color color) => copyWith(color: color);
  TextStyle factor(double factor) =>
      copyWith(fontSize: factor * SizeConfig.horizontalBlockSize);

  TextStyle size(double size) => copyWith(fontSize: size);
  TextStyle setheight(double height) => copyWith(height: height);
  TextStyle letterSpace(double space) => copyWith(letterSpacing: space);
}
