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
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_alt_outlined),
            label: 'ตัวแทนการตลาด',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            label: 'แจ้งเตือน',
          ),
        ],
        selectedItemColor: const Color.fromRGBO(255, 147, 0, 1),
        unselectedItemColor: const Color.fromRGBO(26, 24, 24, 0.5),
      ),
    );
  }
}
