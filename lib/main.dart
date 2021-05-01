import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_sample/routes/app_routes.dart';
import 'package:getx_sample/translations/AppTranslation.dart';

void main() {
  runApp(
    ScreenUtilInit(
      designSize: Size(750, 1334),
      builder: () => GetMaterialApp(
        ///使用系统locale
        locale: Get.deviceLocale,
        title: "Application",
        initialRoute: AppPages.PATH_INITIAL,
        getPages: AppPages.routes,

        ///多语言翻译
        translationsKeys: AppTranslation.translations,
      ),
    ),
  );
}
