import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';
import 'package:getx_sample/components/article_card.dart';
import 'package:getx_sample/components/lazy_load_builder.dart';
import 'package:getx_sample/components/space_header.dart';
import 'package:getx_sample/model/data/article_data.dart';
import 'package:getx_sample/model/data/project_data.dart';
import 'package:getx_sample/routes/app_routes.dart';
import 'package:getx_sample/views/project/project_view_controller.dart';

class ProjectView extends GetView<ProjectViewController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      ///TabController将TabBar和TabView联动起来
      return DefaultTabController(
        length: controller.projectCategories.length,
        child: Scaffold(
          appBar: AppBar(

              ///AppBar总高度 = 导航栏高度（默认56）+bottom preferredSize高度（默认0）
              ///TabBar不带icon默认高度为48，因此指定导航栏高度为48
              toolbarHeight: 48,
              title: _buildProjectTab(controller.projectCategories)),
          body: SafeArea(
            child: _buildProjectPages(controller.projectCategories),
          ),
        ),
      );
    });
  }

  PreferredSizeWidget _buildProjectTab(List<ProjectData> projectCategories) {
    final tabList =
        projectCategories.map((item) => Tab(text: item.name!)).toList();
    return TabBar(
      isScrollable: true,
      tabs: tabList,
    );
  }

  //只使用TabBar+一个ListView，监听TabBar，ListView动态变化，数据懒加载做并缓存。
  //问题1：ListView切页滑动，TabBar相应的变化
  //问题2：监听TabBar需要设置controller，controller需要配合State使用，Get结合State不方便
  Widget _buildProjectPages(List<ProjectData> projectCategories) {
    final tabPages = projectCategories
        .asMap()
        .entries
        .map((entry) => _buildProjectPage(entry.value, entry.key))
        .toList();

    return TabBarView(children: tabPages);
  }

  //问题：多个tab页使用TabView一次性请求完所有页面数据，没必要，且一次性请求多次接口，容易返回null
  //解决1：使用LazyLoaderBuilder实现懒加载，滑动到该页面的时候组件build，触发onBuild方法，调用网络请求。网络请求完成之后，调用update刷新GetBuilder布局
  //解决2：也可以自定义StatefulWidget，网络请求之后刷新自身。需要传入controller
  Widget _buildProjectPage(ProjectData category, int index) {
    return GetBuilder(
        init: controller,
        builder: (_) {
          if (category.children!.isNotEmpty) {
            ///踩坑：ListView列表项滑出屏幕弹回来触发itemBuilder。由于下拉刷新的时候清空了列表，导致越界
            ///解决：使用toList复制一份列表
            ///home页数据没出现是因为Obx监听articles，articles清空之后触发布局刷新，此时ListView为空，不会触发itemBuilder。
            ///因此home页下拉的时候ListView会闪一下空白
            ///当前页面修改的是变量的children属性，不会触发Obx刷新。因此下拉刷新不会闪空白。
            return _buildProjectList(index, category.children!.toList());
          }
          return LazyLoadBuilder(
            onBuild: () => controller.getProjectArticles(index),
          );
        });
  }

  Widget _buildProjectList(int index, List<ArticleData> articles) {
    final divider = Divider(height: 0, color: Colors.transparent);
    return EasyRefresh(
      onRefresh: () => controller.reset(index),
      onLoad: () => controller.loadMore(index),
      header: SpaceHeader(),
      child: ListView.separated(
        itemCount: articles.length,
        separatorBuilder: (_, i) => divider,
        itemBuilder: (_, i) => ArticleCard(articles[i], () {
          Get.toNamed(AppPages.PATH_ARTICLE_DETAIL,
              arguments: articles[i].link);
        }),
      ),
    );
  }
}
