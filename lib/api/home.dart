// 封装一个API，目的是返回业务侧要的数据结构
import 'package:bd_shop/constants/index.dart';
import 'package:bd_shop/utils/DioRequest.dart';
import 'package:bd_shop/viewmodels/home.dart';

Future<List<BannerItem>> getBannerListAPI() async {
  // 返回请求
  return ((await dioRequest.get(HttpConstants.BANNER_LIST)) as List).map((
    item,
  ) {
    return BannerItem.fromJSON(item as Map<String, dynamic>);
  }).toList();
}

// 分类列表
Future<List<CategoryItem>> getCategoryListAPI() async {
  // 返回请求
  return ((await dioRequest.get(HttpConstants.CATEGORY_LIST)) as List).map((
    item,
  ) {
    return CategoryItem.fromJSON(item as Map<String, dynamic>);
  }).toList();
}

// 特惠推荐
Future<SpecialRecommendResult> getProductListAPI() async {
  // 返回请求
  return SpecialRecommendResult.fromJSON(
    await dioRequest.get(HttpConstants.PRODUCT_LIST),
  );
}

// 热榜推荐
Future<SpecialRecommendResult> getInVogueListAPI() async {
  // 返回请求
  return SpecialRecommendResult.fromJSON(
    await dioRequest.get(HttpConstants.IN_VOGUE_LIST),
  );
}

// 一站式推荐
Future<SpecialRecommendResult> getOneStepListAPI() async {
  // 返回请求
  return SpecialRecommendResult.fromJSON(
    await dioRequest.get(HttpConstants.ONE_STOP_LIST),
  );
}
