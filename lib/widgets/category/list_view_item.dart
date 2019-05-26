import 'package:flutter/material.dart';
import 'package:flutter_shop/model.dart';
import 'package:flutter_shop/utils/screen_util.dart';
class SecondryCategory extends StatelessWidget {
  final SubCategoryListModel data;
  SecondryCategory({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double bannerWidth =ScreenUtil().L(253);
    double bannerHeight = ScreenUtil().L(92);
    double pimageIwidth = 65 * deviceWidth / 360;
   
    List<SubCategoryItemModel> items = data.list;
    // var itemsWidget =

    return Column(
      children: <Widget>[
        Image.network(
          data.banner,
          height: bannerHeight,
          width: bannerWidth,
        ),
        GridView.count(
          crossAxisCount: 3,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: items.map((i) {
            return Container(
                margin: EdgeInsets.only(top: 10),
                child: Column(
                  children: <Widget>[
                    Image.network(
                      i.icon,
                      width: pimageIwidth,
                      height: pimageIwidth,
                    ),
                    Text(
                      i.name,
                      style: TextStyle(fontSize: 14),
                    )
                  ],
                ));
          }).toList(),
        ),
      ],
    );
  }
}

class SubCategoryList extends StatefulWidget {
  final double height;
  final SubCategoryListModel data;
  final void Function(String) goPage;
  SubCategoryList({Key key, this.height, this.goPage, this.data})
      : super(key: key);
  @override
  State<StatefulWidget> createState() => SubCategoryListState();
}

class SubCategoryListState extends State<SubCategoryList> {
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerUp: this.dragend,
      child: Container(
        height: widget.height,
        child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.only(top: 13, bottom: 40),
            controller: controller,
            //  physics: NeverScrollableScrollPhysics(),
            child: Container(
              child: widget.data != null
                  ? SecondryCategory(
                      data: widget.data,
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    ),
              constraints: BoxConstraints(minHeight: widget.height + 5),
            )),
      ),
    );
  }

  dragend(e) {
    double offset = controller.offset;
    double maxExtentLenght = controller.position.maxScrollExtent;
    // print('offset' +
    //     offset.toString() +
    //     "     maxextentlength" +
    //     maxExtentLenght.toString());
    // print(widget.goPage);
    if (offset < -50) {
      widget.goPage('pre');
    }
    if (offset - maxExtentLenght > 50) {
      widget.goPage('next');
    }
  }

  // @override
  // void initState() {
  //   super.initState();
  //   controller.addListener(() {
  //     print("extentBefore:" +
  //         controller.position.extentBefore.toString() +
  //         'extentAfter' +
  //         controller.position.extentAfter.toString()+'offset'+controller.offset.toString()+ "outOfRange"+controller.position.outOfRange.toString());
  //         print('viewportDimension'+controller.position.viewportDimension.toString()+'maxScrollExtent.'+ controller.position.maxScrollExtent.toString());

  //   });
  // }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
