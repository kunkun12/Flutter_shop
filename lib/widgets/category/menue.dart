import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_shop/constants/color.dart';


class CategoryMenue extends StatefulWidget {
  final List<String> items;
  final double itemHeight;
  final double itemWidth;
  final ValueChanged<int> menueTaped;
  CategoryMenue(
      {Key key, this.items, this.itemHeight, this.itemWidth, this.menueTaped})
      : super(key: key);
  @override
  State<StatefulWidget> createState() => CategoryMenueState();
}

class CategoryMenueState extends State<CategoryMenue>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  int currentItemIndex = 0;
  @override
  Widget build(BuildContext context) {
    int len = widget.items.length;
    List<Widget> widgets = List.generate(len, (i) {
      return InkWell(
        onTap: () => _menueTaped(i),
        child: Container(
            height: widget.itemHeight,
            alignment: Alignment.center,
            child: Text(
              widget.items[i],
              style: TextStyle(
                  fontSize: currentItemIndex == i ? 16 : 14,
                  color: currentItemIndex == i
                      ? KColorConstant.themeColor
                      : KColorConstant.categoryDefaultColor),
            )),
      );
    });

    return Stack(
      children: <Widget>[
        Positioned(
            width: widget.itemWidth,
            height: widget.itemHeight,
            top: animation.value,
            child: Stack(
              children: <Widget>[
                Container(
                  color: Color(0xFFFFFFFF),
                ),
                Positioned(
                  top: 12.5,
                  child: Container(
                    width: 3,
                    height: 20,
                    color: Color.fromRGBO(132, 95, 63, 1.0),
                  ),
                )
              ],
            )),
        Column(children: widgets)
      ],
    );
  }

  _menueTaped(int i) {
    widget.menueTaped(i);
    moveToTap(i);
  }

  moveToTap(int i) {
    double begin = currentItemIndex * widget.itemHeight;
    double end = i * widget.itemHeight;
    //print('begin'+begin.toString()+"-----"+end.toString());
    animation = Tween(begin: begin, end: end)
        .animate(new CurvedAnimation(parent: controller, curve: Curves.linear));
    controller.addStatusListener((status) {
      if (AnimationStatus.completed == status) {
        //  print(currentItemIndex);
        currentItemIndex = i;
      }
    });

    controller.forward(from: 0);
  }

  initState() {
    controller =
        AnimationController(duration: Duration(milliseconds: 150), vsync: this);
    animation = Tween(begin: 0.0, end: 0.0).animate(controller);
    controller.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
