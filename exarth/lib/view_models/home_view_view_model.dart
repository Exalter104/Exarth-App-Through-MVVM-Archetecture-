import 'package:exarth/data/response/api_response.dart';
import 'package:exarth/models/delivery_model.dart';
import 'package:exarth/repositories/home_repo.dart';
import 'package:flutter/cupertino.dart';

class DeliverListViewViewModel with ChangeNotifier {
  final _myrepo = HomeDeliveryDataGetRepo();
  ApiResponse<DeliverListModel> deliverylistviewviewModel =
      ApiResponse.loading();
  setDeliverList(ApiResponse<DeliverListModel> response) {
    deliverylistviewviewModel = response;
    notifyListeners();
  }

  Future<void> getDeliveryList() async {
    setDeliverList(ApiResponse.loading());

    _myrepo.deliveryListModel().then((value) {
      setDeliverList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setDeliverList(ApiResponse.error(error.toString()));
    });
  }
}
