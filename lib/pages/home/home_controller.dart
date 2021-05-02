import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sample/views/home/home_view.dart';
import 'package:getx_sample/views/nav/nav_view.dart';
import 'package:getx_sample/views/tree/tree_view.dart';

///GetController用于存放数据和控制逻辑
class HomeController extends GetxController{
  final navBarItems = [
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.home),
      label: 'home'.tr,
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.cube),
      label: 'system'.tr,
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.briefcase),
      label: 'navigation'.tr,
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.person),
      label: 'mine'.tr,
    ),
  ];
  final subpages = [
    HomeView(),
    TreeView(),
    NavView(),
    Container(color: Colors.blue),
  ];
}