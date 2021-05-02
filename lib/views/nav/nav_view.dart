import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sample/model/data/nav_data.dart';
import 'package:getx_sample/views/nav/nav_view_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavView extends GetView<NavViewController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => Row(
            children: [
              SizedBox(
                width: 200.w,
                child:
                    _buildNavs(controller.navs, controller.curNav.value?.cid),
              ),
              _buildNavArticles(controller.curNav.value),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavs(List<NavData> navs, int? navId) {
    final divider = Divider(height: 0);
    return ListView.separated(
      itemCount: navs.length,
      itemBuilder: (_, i) => Ink(
        ///给InkWell内部的组件设置颜色，会导致InkWell点击水波纹效果消失，需要在外面套一层Ink或Material组件
        color: navs[i].cid == navId ? Colors.white : Colors.grey[200],
        child: InkWell(
          onTap: () => controller.setNav(navs[i]),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 24.h),
            alignment: Alignment.center,
            child: Text(
              navs[i].name!,
              style: TextStyle(
                  color: navs[i].cid == navId ? Colors.blue : Colors.black),
            ),
          ),
        ),
      ),
      separatorBuilder: (_, i) => divider,
    );
  }

  Widget _buildNavArticles(NavData? nav) {
    if (nav == null) {
      return Expanded(
        child: Container(
          color: Colors.blue,
          alignment: Alignment.center,
          child: Text("Nav is null"),
        ),
      );
    }
    final articles = nav.articles!
        .map(
          (item) => Padding(
            padding: EdgeInsets.all(10.w),
            child: DecoratedBox(
              decoration: BoxDecoration(
                  //背景渐变
                  borderRadius: BorderRadius.circular(3.0),
                  color: Colors.grey[200]),
              child: Padding(
                padding: EdgeInsets.all(20.w),
                child: Text(
                  item.title!,
                  style: TextStyle(color: _getRandomColor()),
                ),
              ),
            ),
          ),
        )
        .toList();
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(20.w),
        alignment: Alignment.topLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              nav.name!,
              style: TextStyle(fontSize: 32.sp),
            ),

            ///Column直接套子组件会超出，使用Expanded包一层，填满
            Expanded(
              ///子组件超出，使用滚动布局，不滚动标题，只滚动标签
              child: SingleChildScrollView(
                child: Wrap(
                  children: articles,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _getRandomColor() {
    return [
      Colors.blue,
      Colors.red,
      Colors.green,
      Colors.amber,
      Colors.cyan,
      Colors.deepOrangeAccent,
      Colors.deepPurple,
      Colors.black,
      Colors.pinkAccent
    ][Random.secure().nextInt(9)];
  }
}
