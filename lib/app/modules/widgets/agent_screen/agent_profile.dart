import 'package:aam_app/app/modules/agent/controllers/agent_controller.dart';
import 'package:aam_app/app/modules/login/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AgentProfile extends StatelessWidget {
  late final LoginController loginController = Get.find<LoginController>();
  final String contractName;
  final String textButton;
  final String referral;

  AgentProfile({
    super.key,
    required this.contractName,
    required this.textButton,
    required this.referral,
  });

  @override
  Widget build(BuildContext context) {
    final AgentController agentController = Get.find<AgentController>();
    return Column(
      children: [
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/agent_profile.svg',
                    width: 50,
                    height: 55,
                  ),
                  SizedBox(width: 22),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        contractName,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        loginController.username.value,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 4),
                      Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(121, 42, 255, 0.05),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          textButton,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(121, 42, 255, 0.75),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,

              children: [
                Text(
                  referral,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 4),
                Text(
                  agentController.referralCode.value.isNotEmpty
                      ? agentController.referralCode.value
                      : 'รหัสแนะนำ',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(121, 42, 255, 0.75),
                    decoration:
                        agentController.referralCode.isNotEmpty
                            ? TextDecoration.none
                            : TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 8),
      ],
    );
  }
}
