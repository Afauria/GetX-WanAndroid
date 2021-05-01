import 'package:get/get.dart';
import 'package:getx_sample/model/data/banner_info.dart';

///GetConnect用于进行http请求和WebSocket连接
class BannersProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) => BannerResponse.fromJson(map);
    httpClient.baseUrl = "https://www.wanandroid.com";
  }

  // Get request
  Future<Response<BannerResponse>> getBanners() => get('/banner/json');

  // Post request
  Future<Response> postBanners(Map data) => post('banners', data);

  Future<Response> deleteBanners(int id) => delete('banners/$id');
}

class BannerResponse {
  List<BannerInfo>? banners;
  int? errorCode;
  String? errorMsg;

  BannerResponse(this.banners, this.errorCode, this.errorMsg);

  BannerResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      banners = <BannerInfo>[];
      json['data'].forEach((v) {
        banners!.add(BannerInfo.fromJson(v));
      });
    }
    errorCode = json['errorCode'];
    errorMsg = json['errorMsg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['data'] = this.banners?.map((v) => v.toJson()).toList();
    data['errorCode'] = this.errorCode;
    data['errorMsg'] = this.errorMsg;
    return data;
  }
}
