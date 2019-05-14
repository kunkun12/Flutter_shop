class PinWeiGoodsModel {
  String name;
  String picUrl;
  double price;
  PinWeiGoodsModel({this.name, this.picUrl, this.price});
  PinWeiGoodsModel.fromJson(dynamic json)
      : picUrl = json['pic_url'],
        price = (json['price_min'] as int) / 100,
        name = json['name'];
}

class PinweiHomeBigArticleModel {
  List<PinWeiGoodsModel> goodsList;
  String title;
  String picUrl;
  PinweiHomeBigArticleModel({this.goodsList, this.title, this.picUrl});
  factory PinweiHomeBigArticleModel.fromJson(dynamic json) {
    List<PinWeiGoodsModel> items;
    if (json['goods_list'] != null) {
      items = (json['goods_list'] as List).map((i) {
        return PinWeiGoodsModel.fromJson(i as dynamic);
      }).toList();
    }
    return PinweiHomeBigArticleModel(
        goodsList: items, title: json['title'], picUrl: json['pic_url']);
  }
}

class PinWeiHomeArticleCoverModel {
  String picurl;
  String title;
  String subtitle;
  PinWeiHomeArticleCoverModel({this.picurl, this.title, this.subtitle});
  PinWeiHomeArticleCoverModel.fromJson(dynamic json)
      : picurl = json['pic_url'],
        title = json['title'],
        subtitle = json['subtitle'];
}

class PinWeiFloorTitleModel {
  String title;
  String url;
  PinWeiFloorTitleModel({this.title, this.url});
  PinWeiFloorTitleModel.fromJson(dynamic json)
      : title = json['title'],
        url = json['url'];
}
