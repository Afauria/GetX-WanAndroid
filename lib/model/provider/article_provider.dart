import 'package:get/get.dart';
import 'package:getx_sample/model/data/article_info.dart';

class ArticleProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) => ArticleResponse.fromJson(map);
    httpClient.baseUrl = "https://www.wanandroid.com";
  }

  Future<Response<ArticleResponse>> getArticles(int page) => get('/article/list/$page/json');
}

class ArticleResponse {
  ArticleList? data;
  int? errorCode;
  String? errorMsg;

  ArticleResponse({this.data, this.errorCode, this.errorMsg});

  ArticleResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? ArticleList.fromJson(json['data']) : null;
    errorCode = json['errorCode'];
    errorMsg = json['errorMsg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['errorCode'] = this.errorCode;
    data['errorMsg'] = this.errorMsg;
    return data;
  }
}