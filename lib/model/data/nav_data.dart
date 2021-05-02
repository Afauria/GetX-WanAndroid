import 'package:getx_sample/model/data/article_data.dart';

class NavData {
  List<ArticleData>? articles;
  int? cid;
  String? name;

  NavData({this.articles, this.cid, this.name});

  NavData.fromJson(Map<String, dynamic> json) {
    if (json['articles'] != null) {
      articles = (json['articles'] as List<dynamic>)
          .map((item) => ArticleData.fromJson(item))
          .toList();
    }
    cid = json['cid'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.articles != null) {
      data['articles'] = this.articles!.map((v) => v.toJson()).toList();
    }
    data['cid'] = this.cid;
    data['name'] = this.name;
    return data;
  }
}
