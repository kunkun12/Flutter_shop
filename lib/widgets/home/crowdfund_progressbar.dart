import 'package:flutter/material.dart';
import 'package:flutter_shop/model.dart';
import 'package:flutter_shop/constants/index.dart';

class ProgressBar extends StatefulWidget {
  final CrowdFundItemModel data;
  final AnimationController controller;
  final Color color;
  ProgressBar(this.data, this.color, {this.controller});
  @override
  State<StatefulWidget> createState() => ProgressBarState();
}

class ProgressBarState extends State<ProgressBar> {
  Animation<int> _saledCountAnimation;
  Animation<int> _progessAnimation;
  Animation<int> _barProgerssAnimation;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: widget.color,
          padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 14.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              RichText(
                text: TextSpan(
                    text: _saledCountAnimation.value.toString(),
                    style: TextStyle(
                        fontSize: 11, color: KColorConstant.priceColor),
                    children: [
                      TextSpan(
                          text: '人支持',
                          style: TextStyle(
                              color: Color.fromRGBO(153, 153, 153, 1.0))),
                      TextSpan(
                          text: '爆',
                          style: TextStyle(
                              letterSpacing: 8,
                              fontSize: 12,
                              background: Paint()
                                ..color = Color.fromRGBO(255, 128, 48, 1.0)))
                    ]),
              ),
              Text(_progessAnimation.value.toString() + '%',
                  style:
                      TextStyle(fontSize: 11, color: KColorConstant.priceColor))
            ],
          ),
        ),
        Container(
          height: 3,
          child: Row(
            children: <Widget>[
              Expanded(
                flex:_barProgerssAnimation.value,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment
                          .centerRight, // 10% of the width, so there are ten blinds.
                      colors: [
                        const Color.fromRGBO(249, 196, 6, 1.0),
                        const Color.fromRGBO(243, 117, 17, 1.0)
                      ], // whitish to gray
                      tileMode: TileMode
                          .repeated, // repeats the gradient over the canvas
                    ),
                  ),
                ),
              ),
             
                Expanded(
                      flex: 100-_barProgerssAnimation.value,
                      child: Container(
                        color: Color.fromRGBO(225, 225, 225, 1.0),
                      ),
                    )
                 
            ],
          ),
        )
      ],
    );
  }


  @override
  void initState() {
    _saledCountAnimation = IntTween(begin: 0, end: widget.data.saledCount)
        .animate(widget.controller);
    _progessAnimation = IntTween(begin: 0, end: widget.data.progress)
        .animate(widget.controller);
    _barProgerssAnimation = IntTween(begin: 0,end: widget.data.progress<100?widget.data.progress:100).animate(widget.controller);
    widget.controller.addListener(_animateChange);
    super.initState();
  }
  _animateChange(){
    setState(() {
          
        });
  }
  @override
    void dispose() {
      widget.controller.removeListener(_animateChange);
      super.dispose();
    }
}
