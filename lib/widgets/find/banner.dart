import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_shop/model.dart';
//export  '../../modal/banner.dart';

class PinweiBannerWidget extends StatelessWidget {
  final BannerListModel banners;
  PinweiBannerWidget(this.banners);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = width * 540.0 / 1080.0;
    return Container(
      width: width,
      height: height,
      child: Swiper(
        viewportFraction: 0.9,
        itemBuilder: (BuildContext context, index) {
          return Container(
            margin: EdgeInsets.only(left: 5,right: 5),
              child: Image.network(
            banners.items[index].picUrl,
            width: width,
            height: height,
          ));
        },
        itemCount: banners.items.length,
        scrollDirection: Axis.horizontal,
        autoplay: true,
      ),
    );
  }
}

