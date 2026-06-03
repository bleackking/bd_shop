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
