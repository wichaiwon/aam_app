import 'package:aam_app/app/modules/login/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class UserPoint extends StatelessWidget {
  late final LoginController loginController = Get.find<LoginController>();
  final String greetingMessage;
  final double pointA;
  final double pointB;

  UserPoint({
    super.key,
    required this.greetingMessage,
    required this.pointA,
    required this.pointB,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'สวัสดี , ${loginController.username.value}',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xBF792AFF),
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              greetingMessage,
              style: TextStyle(fontSize: 14, color: Color(0xBF1a1818)),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/aam_coin.svg',
                      width: 22,
                      height: 22,
                    ),
                    SizedBox(width: 4),
                    Text(
                      NumberFormat.currency(
                        locale: 'th',
                        symbol: '฿',
                        decimalDigits: 0,
                      ).format(pointA),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                Text(
                  '= ${NumberFormat.currency(locale: 'th_TH', name: '฿', decimalDigits: 0).format(pointB)}',
                  style: TextStyle(fontSize: 14, color: Color(0xBF1a1818)),
                ),
              ],
            ),
            SizedBox(width: 8),
            Container(
              width: 24,
              height: 44,
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 147, 0, 0.08),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Center(child: Icon(Icons.chevron_right, size: 24)),
            ),
          ],
        ),
      ],
    );
  }
}
