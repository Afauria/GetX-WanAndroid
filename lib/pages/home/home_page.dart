import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_sample/pages/home/home_controller.dart';
import 'package:flutter/material.dart';

///GetView帮我们查找了控制器，不需要自己再Get.find<Controller>()
class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBuilder: (_, i) => controller.subpages[i],
      tabBar: CupertinoTabBar(items: controller.navBarItems),
    );
  }
}
