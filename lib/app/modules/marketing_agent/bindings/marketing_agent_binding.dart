import 'package:get/get.dart';
import 'package:aam_app/app/modules/marketing_agent/controllers/marketing_agent_controller.dart';

class MarketingAgentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MarketingAgentController>(() => MarketingAgentController());
  }
}
