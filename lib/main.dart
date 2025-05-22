import 'package:aam_app/app/modules/agent/controllers/agent_controller.dart';
import 'package:aam_app/app/modules/home/controllers/home_controller.dart';
import 'package:aam_app/app/modules/login/controllers/login_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  Get.put<LoginController>(LoginController());
  Get.put<HomeController>(HomeController());
  Get.put<AgentController>(AgentController());
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        fontFamily: 'NotoSansThai',
        textTheme: const TextTheme(bodyMedium: TextStyle(fontSize: 16)),
      ),
    ),
  );
}
