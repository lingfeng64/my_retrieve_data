import 'dart:io';

void main() {
  HttpServer.bind(InternetAddress.anyIPv4, 8080).then((server) {
    print('Server running on localhost:${server.port}');
    server.listen((HttpRequest request) {
      // 获取查询参数
      Map<String, String> queryParams = request.uri.queryParameters;
      
      // 提取查询参数中的数据
      String name = queryParams['name'] ?? 'Unknown';
      String age = queryParams['age'] ?? 'Unknown';
      
      // 构造响应
      request.response
        ..write('Hello, $name! Your age is $age.')
        ..close();
    });
  });
}
