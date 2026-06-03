// 基于对Dio进行二次封装

import 'package:bd_shop/constants/index.dart';
import 'package:dio/dio.dart';

class DioRequest {
  final _dio = Dio(); //Dio请求对象
  // 基础地址拦截器
  DioRequest() {
    _dio.options
      ..baseUrl = GlobalConstants.BASE_URL
      ..connectTimeout = Duration(seconds: GlobalConstants.TIME_OUT)
      ..sendTimeout = Duration(seconds: GlobalConstants.TIME_OUT)
      ..receiveTimeout = Duration(seconds: GlobalConstants.TIME_OUT);

    // 拦截器
    _addInterceptor();
  }
  // 添加拦截器
  void _addInterceptor() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (request, handler) {
          handler.next(request);
        },
        onResponse: (response, handler) {
          // http状态码
          if (response.statusCode! >= 200 && response.statusCode! < 300) {
            handler.next(response);
            return;
          }
          handler.reject(DioException(requestOptions: response.requestOptions));
        },
        onError: (error, handler) {
          handler.reject(error);
        },
      ),
    );
  }

  Future<dynamic> get(String url, {Map<String, dynamic>? params}) {
    return _handleResponse(_dio.get(url, queryParameters: params));
  }

  // 进一步处理返回结果的函数
  // 私有函数
  Future<dynamic> _handleResponse(Future<Response<dynamic>> task) async {
    try {
      Response<dynamic> res = await task;
      // data才是真实的接口返回的数据
      final data = res.data as Map<String, dynamic>;
      if (data["code"] == GlobalConstants.SUCCESS_CODE) {
        // 才认定 http 状态和业务范围均为正常 就可以正常的放行通过
        return data["result"]; // 只要result的结果
      }
      // 抛出异常
      throw Exception(data["msg"] ?? "加载数据异常");
    } catch (e) {
      throw Exception(e);
    }
  }
}

// 单例对象
final dioRequest = DioRequest();


// dio请求工具发出请求，返回的数据是 Response<dynamic>.data
// 把所有的接口的data解放出来 拿到真正的数据 要判断业务状态码是不是等于 1

