part of 'api.dart';

class ApiRoutes {
  static const String baseUrl = String.fromEnvironment('API_BASE_URL');

  static Uri _appUri(String path, [Map<String, dynamic>? queryParameters]) =>
      Uri.parse(baseUrl)
          .replace(path: '/api/v1$path', queryParameters: queryParameters);

  static Uri get home => _appUri(
        '/home',
      );

  static Uri posts(PostsParams params) => _appUri(
        '/posts',
        params.toJson(),
      );

  static Uri post(String id) => _appUri(
        '/posts/$id',
      );
}
