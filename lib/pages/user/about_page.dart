import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:getx_sample/routes/app_routes.dart';

class AboutPage extends GetView {
  static const desc = '''本项目使用GetX框架搭建，包含以下技术点：
  * 页面路由
  * 状态管理
  * 网络请求
  * 多语言翻译
  * UI：Tab页面、侧边抽屉栏、列表、富文本等
  * WebView加载网页
  
解决问题：
  * Flutter项目目录结构和代码组织
  * 网络请求封装
  * Tab页懒加载

基于GitHub开源项目学习：''';

  static const desc2 = "\n\n感谢鸿洋大神的WanAndroid Api：";
  static const wanContent = '''
本网站每天新增20~30篇优质文章，并加入到现有分类中，力求整理出一份优质而又详尽的知识体系，闲暇时间不妨上来学习下知识； 除此以外，并为大家提供平时开发过程中常用的工具以及常用的网址导航。

当然这只是我们目前的功能，未来我们将提供更多更加便捷的功能...

如果您有任何好的建议:

—关于网站排版
—关于新增常用网址以及工具
—未来你希望增加的功能等
可以在 ''';

  static const issueUrl = "https://github.com/hongyangAndroid/xueandroid";
  static const sampleUrl = "https://github.com/fengwensheng/getx_wanandroid";
  static const apiUrl = "https://www.wanandroid.com/blog/show/2";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/toolbar_bg.jpg",
                fit: BoxFit.fitWidth,
              ),
              collapseMode: CollapseMode.pin,
            ),
            expandedHeight: 300.h,
            floating: true,
            pinned: true,
            snap: false,
          ),
          SliverPadding(
            padding: EdgeInsets.all(20.w),
            sliver: SliverToBoxAdapter(
              child: Center(
                child: Column(
                  children: [
                    Text(
                      "Flutter WanAndroid实战",
                      style: TextStyle(fontSize: 48.w),
                    ),
                    Text(
                      "Afauria",
                      style: TextStyle(fontSize: 30.w),
                    ),

                    ///富文本
                    Text.rich(TextSpan(children: [
                      TextSpan(
                        text: "项目说明\n\n",
                        style: TextStyle(
                            fontSize: 36.w, fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: desc),
                      TextSpan(
                        text: sampleUrl,
                        style: TextStyle(color: Colors.blue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.toNamed(AppPages.PATH_ARTICLE_DETAIL,
                                arguments: sampleUrl);
                          },
                      ),
                      TextSpan(text: desc2),
                      TextSpan(
                        text: apiUrl,
                        style: TextStyle(color: Colors.blue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.toNamed(AppPages.PATH_ARTICLE_DETAIL,
                                arguments: apiUrl);
                          },
                      ),
                      TextSpan(text: "\n\n"),
                      TextSpan(
                        text: "WanAndroid网站内容\n\n",
                        style: TextStyle(
                            fontSize: 36.w, fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: wanContent),
                      TextSpan(
                        text: issueUrl,
                        style: TextStyle(color: Colors.blue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.toNamed(AppPages.PATH_ARTICLE_DETAIL,
                                arguments: issueUrl);
                          },
                      ),
                      TextSpan(text: " 项目中以issue的形式提出，我将及时跟进。"),
                    ])),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
