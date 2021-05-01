import 'package:get/get.dart';
import 'package:getx_sample/pages/article/binding_article.dart';
import 'package:getx_sample/pages/article/page_article.dart';
import 'package:getx_sample/pages/home/home_binding.dart';
import 'package:getx_sample/pages/home/page_home.dart';

class AppPages {
  static const PATH_INITIAL = "/home";
  static const PATH_INDEX = "/index";
  static const PATH_ARTICLE_DETAIL = "/article";

  static final routes = [
    GetPage(name: "/home", page: () => PageHome(), binding: HomeBinding()),
    GetPage(name: "/article", page: () => PageArticle(), binding: ArticleBinding()),
  ];
}
