import 'package:aam_app/app/modules/widgets/agent_screen/agent_recieve_point.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AgentPoint extends StatelessWidget {
  const AgentPoint({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(AgentRecievePoint());
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color.fromRGBO(249, 249, 249, 1),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'คะแนน AAMP ที่ได้รับ',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(26, 24, 24, 0.35),
              ),
            ),
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/aam_coin.svg',
                      width: 24,
                      height: 24,
                    ),
                    SizedBox(width: 6),
                    Text(
                      NumberFormat.currency(
                        decimalDigits: 0,
                        symbol: '',
                      ).format(12100),
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Icon(Icons.chevron_right, size: 28),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
