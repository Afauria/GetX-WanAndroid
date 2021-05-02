import 'package:getx_sample/model/data/article_data.dart';
import 'package:getx_sample/model/data/banner_data.dart';
import 'package:getx_sample/model/data/nav_data.dart';
import 'package:getx_sample/model/data/tree_data.dart';

class BaseResponse<T> {
  T? data;
  int? errorCode;
  String? errorMsg;

  BaseResponse.fromJson(Map<String, dynamic> map, T d) {
    errorCode = map["errorCode"];
    errorMsg = map["errorMsg"];
    data = d;
  }

  ///列表转换的时候一定要加一下强转List<dynamic>，否则会报错
  static BaseResponse<List<BannerData>> listBanner(map) =>
      BaseResponse.fromJson(
          map,
          (map["data"] as List<dynamic>)
              .map((item) => BannerData.fromJson(item))
              .toList());

  static BaseResponse<List<ArticleData>> listTop(map) =>
      BaseResponse.fromJson(
          map,
          (map["data"] as List<dynamic>)
              .map((item) => ArticleData.fromJson(item))
              .toList());

  static BaseResponse<List<ArticleData>> listArticle(map) =>
      BaseResponse.fromJson(
          map,
          (map["data"]["datas"] as List<dynamic>)
              .map((item) => ArticleData.fromJson(item))
              .toList());

  static BaseResponse<List<TreeData>> listTree(map) =>
      BaseResponse.fromJson(
          map,
          (map["data"] as List<dynamic>)
              .map((item) => TreeData.fromJson(item))
              .toList());

  static BaseResponse<List<NavData>> listNav(map) =>
      BaseResponse.fromJson(
          map,
          (map["data"] as List<dynamic>)
              .map((item) => NavData.fromJson(item))
              .toList());
}
