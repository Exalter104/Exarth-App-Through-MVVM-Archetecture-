// ignore_for_file: unused_import, prefer_final_fields, non_constant_identifier_names

import 'dart:io';

import 'package:exarth/components/Api_urls/end_points.dart';
import 'package:exarth/data/app_exception.dart';
// import 'package:exarth/data/app_exception.dart';
import 'package:exarth/data/network/base_api_urls.dart';
import 'package:exarth/data/network/networkapiservice.dart';

class FinilizedCallingApi {
  BaseApiUrls _access_networok_api = NetworkApiServices();
  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response = await _access_networok_api.getPostApiResponse(
          EndPoints.loginEndPoint, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

//   Future<dynamic> deliveryList() async {
//     try {
//       dynamic response =
//           await _access_networok_api.getGetApiResponse(EndPoints.deliveryList);
//       return response;
//     } catch (e) {
//       rethrow;
//     }
//   }
// }
}
//===. Next From This Screen To view_model/auth_view_model