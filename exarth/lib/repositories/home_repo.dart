import 'package:exarth/components/Api_urls/end_points.dart';
import 'package:exarth/data/network/base_api_urls.dart';
import 'package:exarth/data/network/networkapiservice.dart';
import 'package:exarth/models/delivery_model.dart';

class HomeDeliveryDataGetRepo {
  BaseApiUrls _access_networok_api = NetworkApiServices();
  Future<DeliverListModel> deliveryListModel() async {
    try {
      dynamic response = await _access_networok_api
          .getGetApiResponse(EndPoints.deliveryListEndPoints);
      return response = DeliverListModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
