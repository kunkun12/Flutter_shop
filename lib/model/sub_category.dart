class SubCategoryItemModel {
  String name;
  String icon;
  int ucid;
  SubCategoryItemModel({this.name, this.icon, this.ucid});
  SubCategoryItemModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        icon = json['icon'],
        ucid = json['ucid'];
}

class SubCategoryListModel {
  List<SubCategoryItemModel> list;
  String banner;
  SubCategoryListModel({this.list,this.banner});
  factory SubCategoryListModel.fromJson(dynamic json) {
    var items = json['list'] as List;
    var itemModals = items.map((item) {
      return SubCategoryItemModel.fromJson(item);
    }).toList();
    return SubCategoryListModel(list: itemModals,banner:json['banner']);
  }
}