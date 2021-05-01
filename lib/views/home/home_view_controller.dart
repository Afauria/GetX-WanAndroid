import 'package:get/get.dart';
import 'package:getx_sample/model/ApiService.dart';
import 'package:getx_sample/model/data/article_data.dart';
import 'package:getx_sample/model/data/banner_data.dart';
import 'package:flutter/material.dart';

class HomeViewController extends GetxController {
  final banners = List<BannerData>.empty(growable: true).obs;
  final articles = List<ArticleData>.empty(growable: true).obs;
  final tops = List<ArticleData>.empty(growable: true).obs;
  final _apiService = Get.find<ApiService>();
  final page = 0.obs;

  @override
  void onInit() {
    super.onInit();
    getBanners();
    getArticles();
    getTops();
  }

  void getBanners() {
    _apiService.getBanners().then((resp) {
      banners.assignAll(resp.data!);
    }, onError: (e) {
      Get.snackbar("Error", e.toString());
    });
  }

  void getTops() {
    _apiService.getTops().then((resp) {
      tops.assignAll(resp.data!);
    }, onError: (e) {
      Get.snackbar('ERROR', e.toString(), colorText: Colors.red);
    });
  }

  Future getArticles() async {
    if ((page.value == 0) && (articles.isNotEmpty)) articles.clear();
    _apiService.getArticles(page.value).then((resp) {
      articles.addAll(resp.data!);
      page.value++;
    }, onError: (e) {
      Get.snackbar("Error", e.toString());
    });
  }

  Future<void> reset() async {
    page.value = 0;
    await getArticles();
  }
}
