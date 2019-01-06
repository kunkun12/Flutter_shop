import 'package:flutter/material.dart';
import 'color.dart';
class KfontConstant {
  static TextStyle defaultStyle = TextStyle(
    fontSize: 14.0,
    color: Colors.black,
    decoration: TextDecoration.none,
  );
  static TextStyle fLoorTitleStyle = TextStyle(
    fontSize: 16.0,
    color: KColorConstant.floorTitleColor,
  );
  static TextStyle pinweiCorverSubtitleStyle = TextStyle(
    fontSize: 13.0,
    color: KColorConstant.pinweicorverSubtitleColor,
  );

  static TextStyle cartBottomTotalPriceStyle = TextStyle(fontSize: 18,color: KColorConstant.priceColor);


  static TextStyle searchResultItemCommentCountStyle = TextStyle(
                                fontSize: 12, color: Color(0xFF999999));
                          
}
