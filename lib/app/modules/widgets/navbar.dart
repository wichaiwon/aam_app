import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aam_app/app/modules/main/controllers/main_controller.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    final MainController controller = Get.find();

    return Obx(
      () => BottomNavigationBar(
        currentIndex: controller.currentIndex.value,
        onTap: controller.changeTab,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_alt_outlined),
            label: 'Marketing Agent',
          ),
        ],
      ),
    );
  }
}
