import 'package:flutter/material.dart';
import 'package:flutter_shop/model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_shop/utils/screen_util.dart';
import 'package:flutter_shop/constants/index.dart';

class _TotalWidget extends StatefulWidget {
  final double totalPrice;
  _TotalWidget({Key key, this.totalPrice}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _TotalWidgetState();
}

class _TotalWidgetState extends State<_TotalWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation animation;
  @override
  void initState() {
    _controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    animation = Tween(begin: 0, end: widget.totalPrice).animate(_controller);
    _controller.forward();
    _controller.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  void didUpdateWidget(_TotalWidget oldWidget) {
    animation = Tween(begin: oldWidget.totalPrice, end: widget.totalPrice)
        .animate(_controller);
    _controller.forward(from: 0);

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        RichText(
          text: TextSpan(
              text: KString.totalSumTxt + ":  ",
              style: DefaultTextStyle.of(context).style,
              children: [
                TextSpan(
                    text: '￥${animation.value.toStringAsFixed(2)}',
                    style: KfontConstant.cartBottomTotalPriceStyle)
              ]),
        )
      ],
    );
  }
}

class CartBottomWidget extends StatelessWidget {
  // CartListModel model;
  // BuildContext context;
  @override
  Widget build(BuildContext context) {
    // this.context = context;
    return ScopedModelDescendant<CartListModel>(
        builder: (context, child, model) {
      // this.model = model;
      return Container(
        height: ScreenUtil().L(54),
        decoration: BoxDecoration(
            color: KColorConstant.cartBottomBgColor,
            border: Border(
                top: BorderSide(
                    width: 1, color: KColorConstant.divideLineColor))),
        padding: EdgeInsets.only(left: ScreenUtil().L(12)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                      onTap: () => model.switchAllCheck(),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            model.isAllchecked
                                ? Icons.check_circle_outline
                                : Icons.radio_button_unchecked,
                            color: KColorConstant.themeColor,
                          ),
                          Text(
                            KString.allSelectedTxt,
                            style: TextStyle(letterSpacing: 2),
                          )
                        ],
                      )),
                  Expanded(
                    child: _TotalWidget(
                      totalPrice: model.sumTotal,
                    ),
                  )
                ],
              ),
            ),
            InkWell(
              child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 10),
                  color: KColorConstant.goPayBtBgColor,
                  width: ScreenUtil().L(100),
                  height: ScreenUtil().L(54),
                  child: Text(
                    '${KString.goPayTxt}(${model.totalCount})',
                    style: TextStyle(color: KColorConstant.goPayBtTxtColor),
                  )),
            )
          ],
        ),
      );
    });
  }
}
