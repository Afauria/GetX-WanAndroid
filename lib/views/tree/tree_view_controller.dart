import 'package:get/get.dart';
import 'package:getx_sample/model/ApiService.dart';
import 'package:getx_sample/model/data/tree_data.dart';

class TreeViewController extends GetxController {
  final _apiService = Get.find<ApiService>();
  final trees = <TreeData>[].obs;

  @override
  void onInit() {
    super.onInit();
    getTrees();
  }

  void getTrees() {
    _apiService.getTrees().then((resp) {
      trees.assignAll(resp.data!);
    }, onError: (e) {
      Get.snackbar("Error", e.toString());
    });
  }
}
