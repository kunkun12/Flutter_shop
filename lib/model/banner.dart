

class BannerItemModel {
  String href;
  String picUrl;
  BannerItemModel({this.href, this.picUrl});
  BannerItemModel.fromJson(Map<String, dynamic> json)
      : href = json['href'],
        picUrl = json['pic_url'];
}


class BannerListModel {
  List<BannerItemModel> items;
  BannerListModel({this.items});
  factory BannerListModel.fromJson(dynamic json) {
    List list = (json as List).map((i) {
      return BannerItemModel.fromJson(i);
    }).toList();
    return BannerListModel(items: list);
  }
}

