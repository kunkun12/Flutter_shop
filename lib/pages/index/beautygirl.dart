import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_shop/services/meinv.dart';
import 'imagedetail.dart';

class BeautyGirlWidget extends StatefulWidget {
  final String keyword;
  BeautyGirlWidget({Key key, this.keyword}) : super(key: key);
  @override
  State<StatefulWidget> createState() => BeautyGirlWidgetState();
}

class BeautyGirlWidgetState extends State<BeautyGirlWidget> {
  List<String> images = [];
  @override
  Widget build(BuildContext context) {
    return images.length == 0
        ? Center(
            child: CircularProgressIndicator(),
          )
        : StaggeredGridView.countBuilder(
            padding: EdgeInsets.all(0),
            crossAxisCount: 2,
            itemCount: images.length,
            itemBuilder: (BuildContext context, int index) => new Container(
                constraints: BoxConstraints(minHeight: 100),
                child: Hero(
                  tag: 'currentimage$index',
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute<Null>(builder: (context) {
                        return ImageDetailWidget(
                          currentIndex: index,
                          list: images,
                        );
                      }));
                    },
                    child: Image.network(images[index]),
                  ),
                )),
            staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
          );
  }

  getlist() async {
    var data = await getGirlList(widget.keyword);
    images = data.map((i) => i['thumb'] as String).toList();
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    getlist();
    super.initState();
  }
}
