import 'package:get/get.dart';

class AgentController extends GetxController {
  bool registedAgent = true;
  var referralCode = ''.obs;
  var selectedRecommendIndex = 0.obs;
  var selectedActivity = 'เลือกกิจกรรม'.obs;
  var isBottomSheetOpen = false.obs;
  final RxInt inviteForm = 0.obs;
  final RxInt friendsCount = 0.obs;
  final RxInt loanCount = 0.obs;
  final RxInt loanAmount = 0.obs;

  void setLoanAmount(int amount) {
    loanAmount.value = amount;
  }

  void setLoanCount(int count) {
    loanCount.value = count;
  }

  void setFriendsCount(int count) {
    friendsCount.value = count;
  }

  void selectActivity(String activity) {
    selectedActivity.value = activity;
    isBottomSheetOpen.value = false;
    Get.back();
  }

  void registerAgent() {
    registedAgent = true;
    update();
  }

  void setInviteForm(int form) {
    inviteForm.value = form;
  }

  void setReferralCode(String code) {
    referralCode.value = code;
  }

  void selectRecommend(int index) {
    selectedRecommendIndex.value = index;
  }
}
