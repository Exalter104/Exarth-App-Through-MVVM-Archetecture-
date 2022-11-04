abstract class BaseApiCall {
  Future<dynamic> getGetApiCall(String url);
  Future<dynamic> getPostApiCall(String url, dynamic data);
}
