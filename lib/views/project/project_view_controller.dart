import 'package:get/get.dart';
import 'package:getx_sample/model/ApiService.dart';
import 'package:getx_sample/model/data/article_data.dart';
import 'package:getx_sample/model/data/project_data.dart';

class ProjectViewController extends GetxController {
  final _apiService = Get.find<ApiService>();
  final projectCategories = <ProjectData>[].obs;
  final articles = <ArticleData>[].obs;
  final refreshData = false.obs;
  final Rx<ProjectData?> currentCategory = Rx<ProjectData?>(null);

  @override
  void onInit() {
    super.onInit();
    getProjectList();
  }

  void getProjectList() {
    _apiService.getProjects().then((resp) {
      projectCategories.assignAll(resp.data!);
      currentCategory.value = projectCategories[0];
      getProjectArticles(1, 0);
    }, onError: (e) {
      Get.snackbar("Error", e.toString());
    });
  }

  void getProjectArticles(int page, int index) {
    int id = projectCategories[index].id!;
    _apiService.getProjectArticles(page, id).then((resp) {
      projectCategories[index].children!.assignAll(resp.data!);
      //Obx响应式变量的某个属性改变，不会触发刷新
      //Obx只会监听数据变化，数据没变化的时候不会触发刷新，因此重新赋值projectCategories不会刷新页面
      refreshData.value = !refreshData.value;
    }, onError: (e) {
      Get.snackbar("Error", e.toString());
    });
  }
}
