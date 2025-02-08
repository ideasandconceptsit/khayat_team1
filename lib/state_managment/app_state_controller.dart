// app manage the states
import 'package:get/get.dart';
import 'app_status.dart';

class AppStateController extends GetxController {

  var state = AppState.idle.obs;
  var errorMsg = ''.obs;

  void startLoading() {
    state.value = AppState.loading;
  }

  void setSuccess()
  {
    state.value = AppState.success;
  }

  void setError(String msg)
  {
    state.value = AppState.error;
    errorMsg.value = msg;
  }
}