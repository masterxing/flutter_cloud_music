import 'package:dio/dio.dart';
import 'package:flutter_cloud_music/common/net/code.dart';
import 'package:flutter_cloud_music/common/net/result_data.dart';
import 'package:flutter_cloud_music/common/values/server.dart';
import 'package:get/instance_manager.dart';

class ResponseInterceptors extends InterceptorsWrapper {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final RequestOptions option = response.requestOptions;
    ResultData value;
    try {
      final header = response.headers[Headers.contentTypeHeader];

      if (header != null && header.toString().contains("text") ||
          (response.statusCode! >= 200 && response.statusCode! < 300)) {
        if (option.path.contains('/login/cellphone')) {
          if (response.data['code'].toString() != '200') {
            value = ResultData(response.data, false, response.data['code'],
                msg: response.data['msg'].toString());
          } else {
            value = ResultData(response.data, true, Code.SUCCESS);
          }
        } else {
          value = ResultData(response.data, true, Code.SUCCESS);
        }
      } else {
        value = ResultData(response.data, false, response.data['code']);
      }
    } catch (e) {
      Get.log(e.toString() + option.path, isError: true);
      value = ResultData(response.data, false, response.statusCode!);
    }
    response.data = value;
    handler.next(response);
    // super.onResponse(response, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    logger.d("request path ${options.path}");
    super.onRequest(options, handler);
  }

  // @override
  // Future onResponse(Response response) {

  //   return Future.value(value);
  // }
}
