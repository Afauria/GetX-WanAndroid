import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sample/views/fragment_home.dart';

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
      label: 'project'.tr,
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.person),
      label: 'mine'.tr,
    ),
  ];
  final subpages = [
    HomeView(),
    Container(color: Colors.red),
    Container(color: Colors.green),
    Container(color: Colors.blue),
  ];
}