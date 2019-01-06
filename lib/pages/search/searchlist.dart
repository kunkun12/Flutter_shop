import 'package:flutter/material.dart';
import 'package:flutter_shop/constants/index.dart';
import 'package:flutter_shop/widgets/index.dart';
import 'package:flutter_shop/services/search.dart';
import 'package:flutter_shop/model.dart';

class SearchResultListPage extends StatefulWidget {
  final String keyword;
  SearchResultListPage(this.keyword);

  @override
  State<StatefulWidget> createState() => SearchResultListState();
}

class SearchResultListState extends State<SearchResultListPage> {
  SearchResultListModal listData = SearchResultListModal([]);
  int page = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            brightness: Brightness.light,
            backgroundColor: KColorConstant.searchAppBarBgColor,
            leading: SearchTopBarLeadingWidget(),
            //  actions: <Widget>[SearchTopBarActionWidget()],
            elevation: 0,
            titleSpacing: 0,
            title: SearchListTopBarTitleWidget(keyworld: widget.keyword)),
        body: SearchResultListWidget(listData,
            getNextPage: () => getSearchList(widget.keyword)));
  }

  void getSearchList(String keyword) async {
    var data = await getSearchResult(keyword, page++);
    SearchResultListModal list = SearchResultListModal.fromJson(data);
    setState(() {
      listData.data.addAll(list.data);
    });
  }

  @override
  void initState() {
    getSearchList(widget.keyword);
    super.initState();
  }
}
