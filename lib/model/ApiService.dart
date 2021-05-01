import 'package:get/get.dart';
import 'package:getx_sample/model/BaseResponse.dart';
import 'package:getx_sample/model/data/article_data.dart';
import 'package:getx_sample/model/data/banner_data.dart';

class ApiService extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = "https://www.wanandroid.com";
  }

  Future<BaseResponse<T>> requestGet<T>(url, decoder) async {
    Response r = await get(url, decoder: decoder);
    return r.body;
  }

  Future<BaseResponse<List<BannerData>>> getBanners() async =>
      await requestGet('/banner/json', BaseResponse.listBanner);

  Future<BaseResponse<List<ArticleData>>> getTops() async =>
      await requestGet('/article/top/json', BaseResponse.listTop);

  Future<BaseResponse<List<ArticleData>>> getArticles(int page) async =>
      await requestGet('/article/list/$page/json', BaseResponse.listArticle);
}
