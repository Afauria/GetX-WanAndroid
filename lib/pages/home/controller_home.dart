import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sample/views/fragment_home.dart';

///GetController用于存放数据和控制逻辑
class HomeController extends GetxController{
  final navBarItems = [
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.home),
      label: '首页',
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.cube),
      label: '体系',
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.briefcase),
      label: '项目',
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.person),
      label: '我的',
    ),
  ];
  final subpages = [
    HomeView(),
    Container(color: Colors.red),
    Container(color: Colors.green),
    Container(color: Colors.blue),
  ];
}