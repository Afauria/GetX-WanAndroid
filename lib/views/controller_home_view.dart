import 'package:get/get.dart';
import 'package:getx_sample/model/data/article_info.dart';
import 'package:getx_sample/model/data/banner_info.dart';
import 'package:getx_sample/model/provider/article_provider.dart';
import 'package:getx_sample/model/provider/banners_provider.dart';
import 'package:getx_sample/model/provider/top_provider.dart';
import 'package:flutter/material.dart';

class HomeViewController extends GetxController {
  final banners = List<BannerInfo>.empty(growable: true).obs;
  final articleList = List<ArticleInfo>.empty(growable: true).obs;
  final topList = List<ArticleInfo>.empty(growable: true).obs;
  final _bannersProvider = Get.find<BannersProvider>();
  final _articleProvider = Get.find<ArticleProvider>();
  final _topProvider = Get.find<TopProvider>();
  final page = 0.obs;

  @override
  void onInit() {
    super.onInit();
    getBanners();
    getArticleList();
    getTops();
  }

  void getBanners() {
    _bannersProvider.getBanners().then((resp) {
      banners.assignAll(resp.body!.banners!);
    }, onError: (e) {
      Get.snackbar("Error", e.toString());
    });
  }

  void getTops() {
    _topProvider.getTops().then((resp) {
      topList.assignAll(resp.body!.data!);
    }, onError: (e) {
      Get.snackbar('ERROR', e.toString(), colorText: Colors.red);
    });
  }

  Future getArticleList() async {
    if ((page.value == 0) && (articleList.isNotEmpty)) articleList.clear();
    _articleProvider.getArticles(page.value).then((resp) {
      articleList.addAll(resp.body!.data!.datas!);
      page.value++;
    }, onError: (e) {
      Get.snackbar("Error", e.toString());
    });
  }

  Future<void> reset() async {
    page.value = 0;
    await getArticleList();
  }
}
