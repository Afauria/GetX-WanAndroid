import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:getx_sample/model/data/article_data.dart';
import 'package:getx_sample/model/data/project_data.dart';
import 'package:getx_sample/views/project/project_view_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProjectView extends GetView<ProjectViewController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      ///todo：Get可观察对象中的某个属性变了，不会触发更新，使用refreshData用来触发刷新
      print(controller.refreshData);

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
            child: _buildProjectPage(controller.projectCategories),
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

  //todo 多个tab页使用tabview一次性请求完所有页面数据，没必要，改为懒加载，且一次性请求多次接口，容易返回null
  //只使用TabBar+一个ListView，监听TabBar，ListView动态变化，数据懒加载做并缓存。
  //问题1：ListView切页滑动，TabBar相应的变化
  //问题2：监听TabBar需要设置controller，controller需要配合State使用
  Widget _buildProjectPage(List<ProjectData> projectCategories) {
    final a = projectCategories.asMap().entries.map((entry) {
      if (entry.value.children!.isEmpty) {
        controller.getProjectArticles(1, entry.key);
      }
      return _buildProjectList(entry.value, entry.value.children!);
    }).toList();
    return TabBarView(children: a);
  }

  Widget _buildProjectList(ProjectData? category, List<ArticleData> articles) {
    if (category == null) {
      return Container(child: Text("project is null"));
    }
    final divider = Divider(height: 0, color: Colors.transparent);
    return ListView.separated(
      itemBuilder: (_, i) => _buildProject(articles[i]),
      separatorBuilder: (_, i) => divider,
      itemCount: articles.length,
    );
  }

  Widget _buildProject(ArticleData article) {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Card(
        elevation: 3.w,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.w)),
        ),
        child: Container(
          height: 340.w,
          padding: EdgeInsets.all(20.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                article.envelopePic!,
                width: 180.w,
                height: 300.w,
                fit: BoxFit.fitWidth,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        article.title!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 30.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        article.desc!,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(article.niceDate! + " " + article.author!)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
