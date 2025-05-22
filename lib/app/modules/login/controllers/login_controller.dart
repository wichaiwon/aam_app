import 'package:get/get.dart';

class LoginController extends GetxController {
  final username = ''.obs;

  void setUsername(String value) {
    username.value = value;
  }

  void login() {
    // สามารถเพิ่ม logic การ login ที่นี่หากต้องการ
    Get.put(LoginController());
  }
}
