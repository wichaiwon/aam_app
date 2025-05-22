import 'package:aam_app/app/modules/agent/views/agent_view.dart';
import 'package:aam_app/app/modules/home/views/home_view.dart';
import 'package:aam_app/app/modules/main/controllers/main_controller.dart';
import 'package:aam_app/app/modules/notifications/views/notification_view.dart';
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
          children: [HomeView(), AgentView(), NotificationView()],
        ),
        bottomNavigationBar: const Navbar(),
      ),
    );
  }
}
