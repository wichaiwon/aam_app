import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:aam_app/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Installment extends StatelessWidget {
  final String title;
  final String total;
  final double amount;
  final String deadline;
  final String dateTime;
  final String contract;
  final String conTractNumber;
  final String payFirst;
  final double point;
  final String buttonText;

  final HomeController controller;

  const Installment({
    super.key,
    required this.title,
    required this.total,
    required this.amount,
    required this.deadline,
    required this.dateTime,
    required this.contract,
    required this.conTractNumber,
    required this.payFirst,
    required this.point,
    required this.buttonText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: Color.fromRGBO(121, 42, 255, 1),
                  width: 3,
                ),
              ),
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 10),
                Text(
                  title,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(161, 105, 255, 1),
                  Color.fromRGBO(121, 42, 255, 1),
                ],
              ),
            ),
            child: DefaultTextStyle(
              style: TextStyle(color: Colors.white),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        total,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(255, 255, 255, 0.7),
                        ),
                      ),
                      Text(
                        contract,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(255, 255, 255, 0.7),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        NumberFormat.currency(
                          locale: 'th',
                          symbol: '',
                          decimalDigits: 2,
                        ).format(amount),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        conTractNumber,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        deadline,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(255, 255, 255, 0.7),
                        ),
                      ),
                      Text(
                        payFirst,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(255, 255, 255, 0.7),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        dateTime,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '+ ${NumberFormat.currency(locale: 'th', symbol: '', decimalDigits: 0).format(point)} พอยท์',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Color.fromRGBO(26, 24, 24, 0.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/images/scan.svg',
                          width: 24,
                          height: 24,
                        ),
                        SizedBox(width: 10),
                        Text(
                          buttonText,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int index = 0; index < 3; index++) ...[
                  if (index > 0) SizedBox(width: 6),
                  if (index == controller.selectedInstallmentIndex.value)
                    Container(
                      width: 20,
                      height: 8,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(121, 42, 255, 1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    )
                  else
                    GestureDetector(
                      onTap:
                          () =>
                              controller.selectedInstallmentIndex.value = index,
                      child: Icon(
                        Icons.circle,
                        size: 8,
                        color: Color.fromRGBO(121, 42, 255, 0.5),
                      ),
                    ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
