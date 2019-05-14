import 'package:flutter_web/material.dart';
import 'package:flutter_web/rendering.dart';
import 'package:flutter_cart/widgets/index.dart';
import '../../data/home.dart';
import 'package:flutter_cart/model.dart';

class FisrtTabWidget extends StatefulWidget {
  FisrtTabWidget({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => FisrtTabWidgetState();
}

class FisrtTabWidgetState extends State<FisrtTabWidget>
    with SingleTickerProviderStateMixin {
  final GlobalKey<State> crowdFundingFloorKey = new GlobalKey();
  bool isIntoView = false;
  AnimationController controller;
  @override
  void initState() {
    controller = AnimationController(
      vsync: this, // the SingleTickerProviderStateMixin
      duration: Duration(milliseconds: 2000),
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: _onScroll,
      child: ListView(
        padding: EdgeInsets.all(0),
        children: <Widget>[
          SwipperBanner(banners: banners),
          HomeKingKongWidget(
            data: KingKongList.fromJson(menueDataJson['items']),
            fontColor: (menueDataJson['config'] as dynamic)['color'],
            bgurl: (menueDataJson['config'] as dynamic)['pic_url'],
          ),
          RecommendFloor(ProductListModel.fromJson(recommendJson)),
          CrowdFundingFloor(
              key: crowdFundingFloorKey,
              controller: controller,
              data: CrowdFundingListModel.fromJson(crowdFundingData)),
          RecommendFloor(ProductListModel.fromJson(recommendJson)),
          RecommendFloor(ProductListModel.fromJson(recommendJson)),
          RecommendFloor(ProductListModel.fromJson(recommendJson)),
        ],
      ),
    );
  }

  bool _onScroll(ScrollNotification scroll) {
    if (scroll.depth == 0) {
      var currentContext = crowdFundingFloorKey.currentContext;
      if (currentContext == null) return false;
      RenderBox box = currentContext.findRenderObject();
      RenderBox listBox = scroll.context.findRenderObject();
      RenderAbstractViewport viewport = RenderAbstractViewport.of(box);
      //var offsetToRevealBottom = viewport.getOffsetToReveal(box, 1.0);
      var offset = viewport.getOffsetToReveal(box, 0.5); //到顶部的距离 固定值
      Size size = box.size;
      double scrollY = scroll.metrics.pixels;
      // double insideHeight = scroll.metrics.extentInside; //滚动的内容高度，如果滑动超过底部会
      double insideHeight = listBox.size.height; //listView的高度
      if ((scrollY + insideHeight > offset.offset + size.height) &&
          (offset.offset + size.height > scrollY)) {
        if (!isIntoView) {
          isIntoView = true;
          controller.forward(from: 0);
        }
      } else {
        if (isIntoView) {
          isIntoView = false;
          //  print('消失了');
        }
      }
    }
    return false;
  }
}
