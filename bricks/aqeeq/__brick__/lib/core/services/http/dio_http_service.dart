part of 'http_service.dart';

/// Http service implementation using the Dio package
///
/// See https://pub.dev/packages/dio
class DioHttpService implements HttpService {
  /// Creates new instance of [DioHttpService]
  DioHttpService({
    Dio? dioOverride,
  }) {
    dio = dioOverride ?? Dio(baseOptions);
    dio.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
        maxWidth: 180,
      ),
    );
  }

  /// The Dio Http client
  late final Dio dio;

  /// The Dio base options
  BaseOptions get baseOptions => BaseOptions(
        headers: headers,
      );

  @override
  Map<String, String> headers = {
    'accept': 'application/json',
    'content-type': 'application/json',
  };

  void addInterceptor(Interceptor interceptor) {
    dio.interceptors.add(interceptor);
  }

  @override
  Future<T> get<T>(
    Uri uri, {
    required T Function(dynamic) parser,
    Map<String, dynamic>? headers,
  }) =>
      dio
          .getUri<dynamic>(
            uri,
            options: Options(headers: headers),
          )
          .process<T>(parser);

  @override
  Future<List<T>> getList<T>(
    Uri uri, {
    required T Function(dynamic) parser,
    Map<String, dynamic>? headers,
  }) =>
      dio
          .getUri<dynamic>(
            uri,
            options: Options(headers: headers),
          )
          .processList<T>(parser);

  @override
  Future<T> post<T>(
    Uri uri, {
    required T Function(dynamic) parser,
    dynamic data,
    Map<String, dynamic>? headers,
  }) =>
      dio
          .postUri<dynamic>(
            uri,
            data: data,
            options: Options(headers: headers),
          )
          .process<T>(parser);

  @override
  Future<T> put<T>(
    Uri uri, {
    required T Function(dynamic) parser,
    dynamic data,
    Map<String, dynamic>? headers,
  }) =>
      dio
          .putUri<dynamic>(
            uri,
            data: data,
            options: Options(headers: headers),
          )
          .process<T>(parser);

  @override
  Future<T> delete<T>(
    Uri uri, {
    required T Function(dynamic) parser,
    dynamic data,
    Map<String, dynamic>? headers,
  }) =>
      dio
          .deleteUri<dynamic>(
            uri,
            data: data,
            options: Options(headers: headers),
          )
          .process<T>(parser);

  @override
  void close({bool force = false}) => dio.close(force: force);
}
