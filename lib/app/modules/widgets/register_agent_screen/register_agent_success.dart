import 'package:aam_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterAgentSuccess extends StatelessWidget {
  const RegisterAgentSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, size: 100, color: Colors.green),
            const SizedBox(height: 20),
            const Text(
              'Agent Registered Successfully!',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.offNamed(Routes.AGENT);
              },
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
