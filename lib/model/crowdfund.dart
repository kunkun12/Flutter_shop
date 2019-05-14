class CrowdFundItemModel {
  String name;
  String summary;
  String picUrl;
  int marketPrice;
  int progress;
  int saledCount;
  String jumpUrl;
  CrowdFundItemModel(
      {this.name,
      this.marketPrice,
      this.progress,
      this.saledCount,
      this.jumpUrl,
      this.picUrl,
      this.summary});
  factory CrowdFundItemModel.fromJson(dynamic json) {
    return CrowdFundItemModel(
        name: json['name'],
        summary: json['summary'],
        picUrl: json['pic_url'],
        marketPrice: json['market_price'],
        progress: json['progress'],
        saledCount: json['saled_count'],
        jumpUrl: json['jump_url']);
  }
}

class CrowdFundingListModel {
  List<CrowdFundItemModel> items;
  String title;

  CrowdFundingListModel({this.items, this.title});
  factory CrowdFundingListModel.fromJson(Map<String, dynamic> json) {
    var itemsList = json['items'] as List;
    var items = itemsList.map((i) {
      return CrowdFundItemModel.fromJson(i);
    }).toList();

    return CrowdFundingListModel(items: items, title: json['title']);
  }
}
