import 'package:aam_app/app/modules/main/controllers/main_controller.dart';
import 'package:aam_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class RegisterAgentReferralCodeSuccess extends StatelessWidget {
  const RegisterAgentReferralCodeSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(161, 105, 255, 1),
              Color.fromRGBO(121, 42, 255, 1),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Container(
          height: double.infinity,
          decoration: BoxDecoration(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(height: 81),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [SvgPicture.asset('assets/images/checked.svg')],
                  ),
                  SizedBox(height: 24),
                  Text(
                    textAlign: TextAlign.center,
                    'ยืนยันรหัสแนะนำ\nเรียบร้อย',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 48),
                    decoration: BoxDecoration(),
                    child: Text(
                      textAlign: TextAlign.center,
                      'ข้อมูลผู้แนะนำของคุณ ได้ถูกลงทะเบียนและผูกบัญชีของคุณ แล้วเรียบร้อย',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(255, 255, 255, 0.9),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(),
                    child: ElevatedButton(
                      onPressed: () {
                        Get.offNamed(Routes.MAIN);
                        Future.delayed(const Duration(milliseconds: 50), () {
                          final MainController mainController =
                              Get.find<MainController>();
                          mainController.changeTab(1);
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(26, 24, 24, 0.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: Text(
                        'ตกลง',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 48),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
