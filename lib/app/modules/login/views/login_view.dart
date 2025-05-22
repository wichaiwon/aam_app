import 'package:aam_app/app/modules/login/controllers/login_controller.dart';
import 'package:aam_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends GetView<LoginController> {
  final TextEditingController _usernameController = TextEditingController();

  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
              onChanged: controller.setUsername,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // ตั้งค่า username ใน controller
                controller.setUsername(_usernameController.text);

                // ตรวจสอบว่า username ไม่ว่างเปล่า
                if (_usernameController.text.isNotEmpty) {
                  controller.login();
                  Get.offAllNamed(
                    Routes.MAIN,
                  ); // เปลี่ยนเส้นทางไปยังหน้า MainView
                } else {
                  Get.snackbar('Error', 'Please enter your username');
                }
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
