import 'package:bd_shop/constants/index.dart';
import 'package:bd_shop/utils/DioRequest.dart';
import 'package:bd_shop/viewmodels/home.dart';

// 猜你喜欢
Future<GoodsDetailsItems> getGuessListAPI(Map<String, dynamic> params) async {
  return GoodsDetailsItems.fromJSON(
    await dioRequest.get(HttpConstants.GUESS_LIST, params: params),
  );
}
