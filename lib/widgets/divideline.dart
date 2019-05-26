import 'package:flutter/material.dart';
import 'package:flutter_shop/constants/index.dart';
import 'package:flutter_shop/utils/screen_util.dart';

class DivideLineWidget extends StatelessWidget{
  final double width;
  DivideLineWidget({Key key,this.width}):super(key:key);
  @override
    Widget build(BuildContext context) {
      return Container(
          height: ScreenUtil().L(width),
          alignment: Alignment.center,
          color: KColorConstant.divideLineColor,
          );
    }
}