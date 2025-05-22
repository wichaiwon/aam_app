import 'package:aam_app/app/modules/home/controllers/home_controller.dart';
import 'package:aam_app/app/modules/widgets/home_screen/catagories_button.dart';
import 'package:aam_app/app/modules/login/controllers/login_controller.dart';
import 'package:aam_app/app/modules/widgets/home_screen/installment.dart';
import 'package:aam_app/app/modules/widgets/home_screen/loan.dart';
import 'package:aam_app/app/modules/widgets/home_screen/service.dart';
import 'package:aam_app/app/modules/widgets/home_screen/user_point.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  final LoginController loginController = Get.find<LoginController>();
  final HomeController homeController = Get.find<HomeController>();
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'หน้าหลัก',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      // Handle chat icon press
                    },
                    child: SvgPicture.asset(
                      'assets/images/chat.svg',
                      width: 24,
                      height: 24,
                    ),
                  ),
                  SizedBox(width: 24),
                  GestureDetector(
                    onTap: () {
                      // Handle notification icon press
                    },
                    child: SvgPicture.asset(
                      'assets/images/setting.svg',
                      width: 24,
                      height: 24,
                    ),
                  ),
                  SizedBox(width: 24),
                  GestureDetector(
                    onTap: () {
                      // Handle profile icon press
                    },
                    child: SvgPicture.asset(
                      'assets/images/avatar.svg',
                      width: 24,
                      height: 24,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              SizedBox(height: 18),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  UserPoint(
                    greetingMessage: 'เอเอเอ็ม ยินดีให้บริการ',
                    pointA: 0,
                    pointB: 0,
                  ),
                ],
              ),
              SizedBox(height: 18),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'หมวดหมู่',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 8),
                  CategoriesButton(
                    categories: homeController.categories,
                    selectedCategoryIndex: homeController.selectedCategoryIndex,
                    onCategorySelected: (index) {
                      homeController.selectCatagory(index);
                    },
                  ),
                  SizedBox(height: 18),
                  Column(
                    children: [
                      Loan(
                        key: Key('loan1'),
                        title: 'เอเอเอ็ม พร้อมใช้',
                        yourLoan: 'จำนวนสินเชื่อของคุณ',
                        loanAmount: 5000,
                        loanStatus: 'สินเชื่อเงินสดพร้อมใช้ อนุมัติทันที',
                        condition: 'ดูเงื่อนไข',
                        loanButton: 'รับสินเชื่อ',
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  Column(
                    children: [
                      Installment(
                        key: Key('installment1'),
                        title: 'ค่างวด',
                        total: 'ยอดที่ต้องชำระ',
                        amount: 1700.65,
                        deadline: 'วันครบกำหนดชำระ',
                        dateTime: '25 ก.ย. 2567',
                        contract: 'เลขที่สัญญา',
                        conTractNumber: 'AMML32809',
                        payFirst: 'ชำระก่อนวันครบกำหนด',
                        point: 1000,
                        buttonText: 'จ่ายค่างวด',
                        controller: homeController,
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  Column(
                    children: [
                      Service(
                        title: 'เมนูบริการ',
                        registerLoan: 'สมัครสินเชื่อ',
                        registerInstallment: '5,000 \nพร้อมใช้',
                        branch: 'สาขา',
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
