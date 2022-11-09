import 'dart:convert';
import 'dart:io';
// import 'package:flutter/material.dart';
import 'package:exarth/data/app_exception.dart';
import 'package:exarth/data/network/base_api_urls.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class NetworkApiServices extends BaseApiUrls {
  @override
  // string url==.from baseapiurls
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response = await http.get(
        Uri.parse(
          url,
        ),
        headers: {
          'authorization':
              'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjY4MDI4OTYzLCJpYXQiOjE2Njc5NDI1NjMsImp0aSI6IjlmZTJmYjA0MTUwNTQ3ODQ4ZTMzYTQxOGQzYTJkNTRmIiwidXNlcl9pZCI6Ijc1ZGY1NDFlLTQ4NDMtNDZiYS1iMjg0LTAxNDAzNzI1NDZmZCJ9.8HZwlmPuk3MCnob8Ecwj2EGJ0Nrz4J7LNj-lbc22wPI',
        },
      ).timeout(
        Duration(seconds: 10),
      );

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      Response response =
          await post(Uri.parse(url), body: data).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      case 400:
        throw BadRequestException(response.body.toString());
      case 500:
        throw UnAutherizedRequestException(response.body.toString());
      case 404:
        throw InvalidInputsException(response.body.toString());
      default:
        throw FetchDataException(
            // ignore: prefer_adjacent_string_concatenation
            "Error occured while communicate with server " +
                "with status code" +
                response.statusCode.toString());
    }
  }
}
