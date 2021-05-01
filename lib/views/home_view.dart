import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';
import 'package:getx_sample/components/space_header.dart';
import 'package:getx_sample/model/data/article_data.dart';
import 'package:getx_sample/model/data/banner_data.dart';
import 'package:getx_sample/routes/app_routes.dart';
import 'package:getx_sample/views/home_view_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends GetView<HomeViewController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        ///使用Obx响应controller数据变化
        child: Obx(
          () => Column(
            children: [
              _buildBanners(controller.banners),
              _buildArticleList(controller.tops, controller.articles),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBanners(List<BannerData> banners) {
    return SizedBox(
      height: Get.height / 4,

      ///轮播图控件
      child: Swiper(
        itemCount: banners.length,
        itemBuilder: (_, i) =>
            Image.network("${banners[i].imagePath}", fit: BoxFit.cover),
        autoplay: true,
        pagination: SwiperPagination(
          alignment: Alignment.bottomRight,
          builder: DotSwiperPaginationBuilder(
            activeSize: 15.w,
            size: 10.w,
            activeColor: Colors.blue,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget _buildArticleList(topList, articleList) {
    return Expanded(
      child: EasyRefresh(
        onRefresh: controller.reset,
        onLoad: controller.getArticles,
        header: SpaceHeader(),
        child: ListView.separated(
          itemBuilder: (_, i) {
            final isTop = i < topList.length;
            final info = isTop ? topList[i] : articleList[i - topList.length];
            return _buildArticle(i, info, isTop);
          },
          separatorBuilder: (_, i) => Divider(),
          itemCount: topList.length + articleList.length,
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 20.h,
          ),
        ),
      ),
    );
  }

  Widget _buildArticle(int i, ArticleData info, bool isTop) => InkWell(
        onTap: () {
          Get.toNamed(AppPages.PATH_ARTICLE_DETAIL, arguments: info.link);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                isTop
                    ? Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 2.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(3)),
                          border: Border.all(
                            color: Colors.red[900]!,
                          ),
                        ),
                        child: Text(
                          '置顶',
                          style: TextStyle(
                            color: Colors.red[900],
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    : Container(),
                SizedBox(width: 20.w),
                Text(
                  info.author!,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18.sp,
                  ),
                ),
                Spacer(),
                Text(
                  info.niceDate!,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18.sp,
                  ),
                ),
              ],
            ),
            Text(
              info.title!,
              style: TextStyle(
                fontSize: 32.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                Text(
                  info.superChapterName!,
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  info.chapterName!,
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
