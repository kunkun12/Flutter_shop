import 'package:flutter/material.dart';
import 'package:flutter_shop/utils/screen_util.dart';
import 'package:flutter_shop/constants/index.dart';
class BottomAppBarItemModal {
  final IconData iconData;
  final String text;
  BottomAppBarItemModal(this.iconData, this.text);
}

class BottomAppBarItem extends StatelessWidget {
  final IconData iconData;
  final String text;
  final Color color;
  final ValueChanged<int> onTabSeleted;
  final int index;
  BottomAppBarItem(
      this.iconData, this.text, this.color, this.onTabSeleted, this.index);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTabSeleted(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            iconData,
            color: color,
          ),
          Text(
            text,
            style: TextStyle(color: color),
          )
        ],
      ),
    );
  }
}

class KKBottomAppBar extends StatefulWidget {
  final List<BottomAppBarItemModal> items;
  final ValueChanged<int> onTabSeleted;
  final Color actviveColor;
  final Color color;
  KKBottomAppBar({this.items, this.onTabSeleted, this.actviveColor, this.color})
      : super();
  @override
  BottomAppBarState createState() => BottomAppBarState();
}

class BottomAppBarState extends State<KKBottomAppBar> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    int l = widget.items.length;
   // print(this.currentIndex);
    double bottom = ScreenUtil.bottomBarHeight; //IPhone 底部
    List<BottomAppBarItem> listWidgets = List.generate(l, (index) {
      BottomAppBarItemModal i = widget.items[index];
      return BottomAppBarItem(
          i.iconData,
          i.text,
          index == currentIndex ? widget.actviveColor : widget.color,
          onItemTap,
          index);
    });
    return Container(
      height: Klength.bottomBarHeight,
      color: KColorConstant.bottomBarbgColor,
      alignment: Alignment.center,
      margin: EdgeInsets.only(bottom: bottom),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: listWidgets,
      ),
    );
  }

  onItemTap(int i) {
    setState(()=>this.currentIndex=i);
    
    widget.onTabSeleted(i);
  }
}
