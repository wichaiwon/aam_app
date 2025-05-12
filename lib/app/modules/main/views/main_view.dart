import 'package:aam_app/app/modules/home/views/home_view.dart';
import 'package:aam_app/app/modules/main/controllers/main_controller.dart';
import 'package:aam_app/app/modules/marketing_agent/views/marketing_agent_view.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:aam_app/app/modules/widgets/navbar.dart';

class MainView extends GetView<MainController> {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: IndexedStack(
          index: controller.currentIndex.value,
          children: [HomeView(), const MarketingAgentView()],
        ),
        bottomNavigationBar: const Navbar(),
      ),
    );
  }
}
