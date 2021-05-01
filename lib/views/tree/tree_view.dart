import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:getx_sample/model/data/tree_data.dart';
import 'package:getx_sample/routes/app_routes.dart';
import 'package:getx_sample/views/tree/tree_view_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TreeView extends GetView<TreeViewController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        ///使用Obx响应controller数据变化
        child: Obx(
          () => _buildTrees(controller.trees),
        ),
      ),
    );
  }

  Widget _buildTrees(List<TreeData> trees) {
    final divider = Divider();
    return ListView.separated(
      itemCount: trees.length,
      itemBuilder: (_, i) => _buildTree(trees[i]),
      separatorBuilder: (_, i) => divider,
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        //这里的边距是ListView上下边距，不是item边距
        vertical: 20.h,
      ),
    );
  }

  Widget _buildTree(TreeData tree) {
    final subTree = tree.children!.map((item) => item.name).join("、");
    return InkWell(
      onTap: () {
        Get.toNamed(AppPages.PATH_ARTICLE_DETAIL, arguments: tree.id);
      },
      child: Row(
        children: [
          ///Expand弹性布局，按比例分配剩余空间，类似于Android Weight=1
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 0.w, vertical: 12.h),
                  child: Text(
                    tree.name!,
                    style: TextStyle(
                      fontSize: 32.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(subTree),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 24.w,
          ),
        ],
      ),
    );
  }
}
