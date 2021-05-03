
import 'package:get/get.dart';
import 'package:getx_sample/pages/home/home_controller.dart';
import 'package:getx_sample/views/home/home_view_controller.dart';
import 'package:getx_sample/views/nav/nav_view_controller.dart';
import 'package:getx_sample/views/project/project_view_controller.dart';
import 'package:getx_sample/views/tree/tree_view_controller.dart';

///Bindings是一个依赖管理器
///可以在不同页面间共享实例，而不是在视图中实例化
class HomeBinding extends Bindings {
  @override
  void dependencies() {
    ///可以通过[Get.put，Get.lazyPut，Get.putAsync，Get.create]方法注入实例
    ///通过Get.find可以获取实例
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<HomeViewController>(() => HomeViewController());
    Get.lazyPut<TreeViewController>(() => TreeViewController());
    Get.lazyPut<NavViewController>(() => NavViewController());
    Get.lazyPut<ProjectViewController>(() => ProjectViewController());
  }
}
