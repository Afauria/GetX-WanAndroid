import 'package:get/get.dart';
import 'package:getx_sample/model/ApiService.dart';
import 'package:getx_sample/model/data/nav_data.dart';

class NavViewController extends GetxController {
  final navs = <NavData>[].obs;
  final Rx<NavData?> curNav = Rx<NavData?>(null);
  final _apiService = Get.find<ApiService>();

  @override
  void onInit() {
    super.onInit();
    getNavs();
  }

  void getNavs() {
    _apiService.getNavs().then((resp) {
      navs.assignAll(resp.data!);
      curNav.value = navs[0];
    }, onError: (e) {
      Get.snackbar("Error", e.toString());
    });
  }

  void setNav(NavData nav) {
    curNav.value = nav;
  }
}
