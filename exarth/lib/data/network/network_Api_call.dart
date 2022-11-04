// ignore_for_file: file_names

import 'dart:convert';
import 'dart:io';

import 'package:exarth/data/app_exception_errors.dart';
import 'package:exarth/data/network/base_api_call.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class NetworkApiCall extends BaseApiCall {
  @override
  Future getGetApiCall(String url) async {
    dynamic responseJson;

    try {
      final response =
          await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataExceptionError("No  Internet Connection");
    }
    return responseJson;
  }

  @override
  Future getPostApiCall(String url, dynamic data) async {
    dynamic responseJson;

    try {
      Response response =
          await post(Uri.parse(url), body: data).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataExceptionError("No  Internet Connection");
    }
    return responseJson;
  }
}

dynamic returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      dynamic responseJson = jsonDecode(response.body);
      return responseJson;
    case 400:
      throw BadRequestExceptionError(response.body.toString());
    case 404:
      throw UnautherizedExceptionError(response.body.toString());

    default:
      throw FetchDataExceptionError(
          // ignore: prefer_adjacent_string_concatenation
          "Error Occured while Communicating with Server" +
              "with Status Code" +
              response.statusCode.toString());
  }
}
