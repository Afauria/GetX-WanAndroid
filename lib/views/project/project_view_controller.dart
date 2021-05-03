import 'package:get/get.dart';
import 'package:getx_sample/model/ApiService.dart';
import 'package:getx_sample/model/data/article_data.dart';
import 'package:getx_sample/model/data/project_data.dart';

class ProjectViewController extends GetxController {
  final _apiService = Get.find<ApiService>();
  final projectCategories = <ProjectData>[].obs;
  final articles = <ArticleData>[].obs;
  final Rx<ProjectData?> currentCategory = Rx<ProjectData?>(null);
  final loadPageMap = {};

  @override
  void onInit() {
    super.onInit();
    getProjectList();
  }

  void getProjectList() {
    _apiService.getProjects().then((resp) {
      projectCategories.assignAll(resp.data!);
      currentCategory.value = projectCategories[0];
    }, onError: (e) {
      Get.snackbar("Error", e.toString());
    });
  }

  void getProjectArticles(int index) {
    if(loadPageMap[index] == null) {
      loadPageMap[index] = 1;
    }
    int id = projectCategories[index].id!;
    _apiService.getProjectArticles(loadPageMap[index], id).then((resp) {
      projectCategories[index].children!.addAll(resp.data!);
      //Obx响应式变量的某个属性改变，不会触发刷新
      //Obx只会监听数据变化，数据没变化的时候不会触发刷新，因此重新赋值projectCategories不会刷新页面
      //使用update()通知GetBuilder局部刷新，不刷新整个Obx
      update();
    }, onError: (e) {
      Get.snackbar("Error", e.toString());
    });
  }

  Future<void> reset(int index) async {
    loadPageMap[index] = 1;
    projectCategories[index].children!.clear();
    getProjectArticles(index);
  }

  Future<void> loadMore(int index) async {
    loadPageMap[index]++;
    getProjectArticles(index);
  }
}
