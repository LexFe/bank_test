import 'package:dio/dio.dart';
import 'package:login/common/values/constant.dart';
import 'package:login/global.dart';

class HttpUtil {
  late Dio dio;

  static final HttpUtil _instance = HttpUtil._internal();

  factory HttpUtil() => _instance;

  HttpUtil._internal() {
    BaseOptions options = BaseOptions(
      baseUrl: 'http://10.0.2.2:3000/',
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      responseType: ResponseType.json,
      validateStatus: (_) => true,
    );

    dio = Dio(options);
    dio.options.validateStatus = (_) => true;
  }

  Future post(String path,
      {dynamic data,
      Options? options,
      Map<String, dynamic>? queryParameters}) async {
    Options reqOptions = options ?? Options();
    reqOptions.headers = reqOptions.headers ?? {};
    Map<String, dynamic>? login = getLoginTokenHaeder();
    // ignore: unnecessary_null_comparison
    if (login != null) {
      reqOptions.headers!.addAll(login);
      reqOptions.validateStatus = (_) => true;
    }

    var response = await dio.post(path,
        data: data, queryParameters: queryParameters, options: reqOptions);
    return response;
  }

  Map<String, dynamic> getLoginTokenHaeder() {
    var header = <String, dynamic>{};
    var accessToken =
        Global.userService.getUserToken(AppConstants.STORAGE_USER_TOKEN_KEY);
    if (accessToken.isNotEmpty) {
      header["Baerer"] = accessToken;
    }
    return header;
  }

  Future get(String path,
      {Options? options, Map<String, dynamic>? queryParameters}) async {
    Options reqOptions = options ?? Options();
    reqOptions.headers = reqOptions.headers ?? {};
    Map<String, dynamic>? login = getLoginTokenHaeder();
    // ignore: unnecessary_null_comparison
    if (login != null) {
      reqOptions.headers!.addAll(login);
      reqOptions.validateStatus = (_) => true;
    }

    reqOptions.followRedirects = false;
    final response = await dio.get(
      path,
      options: reqOptions,
      queryParameters: queryParameters,
    );
    return response;
  }

  Future patch(String path,
      {dynamic data,
      Options? options,
      Map<String, dynamic>? queryParameters}) async {
    Options reqOptions = options ?? Options();
    reqOptions.headers = reqOptions.headers ?? {};
    Map<String, dynamic>? login = getLoginTokenHaeder();
    // ignore: unnecessary_null_comparison
    if (login != null) {
      reqOptions.headers!.addAll(login);
      reqOptions.validateStatus = (_) => true;
    }

    var response = await dio.patch(path,
        data: data, queryParameters: queryParameters, options: reqOptions);
    return response;
  }
}
