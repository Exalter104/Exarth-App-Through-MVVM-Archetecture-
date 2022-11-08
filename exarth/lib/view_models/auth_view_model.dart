import 'package:exarth/components/show_messages/show_responses.dart';
import 'package:exarth/repositories/finilized_api_call.dart';
import 'package:exarth/utils/Routes/routes_name.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = FinilizedCallingApi();
  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.loginApi(data).then((value) {
      setLoading(false);
      ShowResponses.flushBarSuccessMessage(
          "You Data is Valid You May Go to Home Screen", context);
      Navigator.pushNamed(context, RoutesNames.home);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        ShowResponses.flushBarErrorMessage(error.toString(), context);
        print(error.toString());
      }
    });
  }

  // Future<void> deliveryList(url, BuildContext context) async {
  //   setLoading(true);
  //   _myRepo.deliveryList().then((value) {
  //     setLoading(false);
  //     ShowResponses.flushBarSuccessMessage(
  //         "You Data is Valid You May Go to Home Screen", context);
  //     Navigator.pushNamed(context, RoutesNames.home);
  //     if (kDebugMode) {
  //       print(value.toString());
  //     }
  //   }).onError((error, stackTrace) {
  //     setLoading(false);
  //     if (kDebugMode) {
  //       ShowResponses.flushBarErrorMessage(error.toString(), context);
  //       print(error.toString());
  //     }
  //   });
  // }
}
