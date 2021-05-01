import 'package:get/get.dart';
import 'package:getx_sample/model/data/article_info.dart';

class TopProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) => TopResponse.fromJson(map);
    httpClient.baseUrl = "https://www.wanandroid.com";
  }

  Future<Response<TopResponse>> getTops() async => await get('/article/top/json');
}

class TopResponse {
  List<ArticleInfo>? data;
  int? errorCode;
  String? errorMsg;

  TopResponse({this.data, this.errorCode, this.errorMsg});

  TopResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ArticleInfo>[];
      json['data'].forEach((v) {
        data!.add(ArticleInfo.fromJson(v));
      });
    }
    errorCode = json['errorCode'];
    errorMsg = json['errorMsg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['errorCode'] = this.errorCode;
    data['errorMsg'] = this.errorMsg;
    return data;
  }
}