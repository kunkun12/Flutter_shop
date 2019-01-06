import 'package:flutter/material.dart';
import 'package:flutter_shop/constants/index.dart';
class TopBarWidget extends StatelessWidget {
  final String title;
  TopBarWidget(this.title);
  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Container(
      padding: EdgeInsets.only(top: statusBarHeight),
      alignment: Alignment.center,
      height: statusBarHeight + Klength.topBarHeight,
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Color(0xFFe1e1e1), width: 1))),
      child:
          Text(title, style: TextStyle(color: Color(0xFF313131), fontSize: 18)),
    );
  }
}
