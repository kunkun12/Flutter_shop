import 'package:flutter_web/material.dart';
import 'package:flutter_cart/constants/index.dart';
import 'package:flutter_cart/utils/screen_util.dart';

class DivideLineWidget extends StatelessWidget{
  final double width;
  DivideLineWidget({Key key,this.width}):super(key:key);
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Container(
          height: ScreenUtil().L(width),
          alignment: Alignment.center,
          color: KColorConstant.divideLineColor,
          );
    }
}