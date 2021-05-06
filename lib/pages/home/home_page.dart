import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_sample/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:getx_sample/routes/app_routes.dart';

///GetView帮我们查找了控制器，不需要自己再Get.find<Controller>()
class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildDrawer(),
      body: CupertinoTabScaffold(
        tabBuilder: (_, i) => controller.subpages[i],
        tabBar: CupertinoTabBar(items: controller.navBarItems),
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    width: 100.0,
                    height: 100.0,
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/avatar.png"),
                    ),
                  ),
                  Text(
                    "Afauria",
                    style: TextStyle(fontSize: 40.w, color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Get.toNamed(AppPages.PATH_ABOUT);
            },
            leading: Icon(Icons.info_outline),
            title: Text('关于我们',
                style: TextStyle(fontSize: 32.w, color: Colors.black54)),
          ),
        ],
      ),
    );
  }
}
