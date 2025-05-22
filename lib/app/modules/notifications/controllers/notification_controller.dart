import 'package:get/get.dart';

class NotificationController extends GetxController {
  final RxInt currentPage = 0.obs;

  get pageController => null;

  void setCurrentPage(int page) {
    currentPage.value = page;
  }
}
