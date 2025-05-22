import 'package:aam_app/app/modules/agent/controllers/agent_controller.dart';
import 'package:aam_app/app/modules/widgets/agent_screen/agent_invite_friend.dart';
import 'package:aam_app/app/modules/widgets/agent_screen/agent_referral_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AgentRecommend extends StatelessWidget {
  final String desc1;
  final String desc2;
  final String desc3;

  const AgentRecommend({
    super.key,
    required this.desc1,
    required this.desc2,
    required this.desc3,
  });

  @override
  Widget build(BuildContext context) {
    final AgentController agentController = Get.find<AgentController>();
    return Container(
      decoration: BoxDecoration(),
      child: Column(
        children: [
          SizedBox(height: 20),
          Row(
            children: [
              SvgPicture.asset('assets/images/line.svg', height: 21, width: 16),
              SizedBox(width: 8),
              Text(
                'กิจกรรมแนะนำ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.fromLTRB(16, 14, 16, 26),
            decoration: BoxDecoration(
              color: Color.fromRGBO(249, 249, 249, 1),
              borderRadius: BorderRadius.circular(16),
            ),

            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: 100, maxHeight: 132),
              child: PageView(
                children: List.generate(2, (index) {
                  final titles = [
                    'แนะนำเพื่อนมาจัดสินเชื่อ',
                    'ชวนดาวน์โหลดแอพ',
                  ];
                  final descriptions = [
                    'รับคะแนนสูงสุด ${NumberFormat.currency(locale: 'th', symbol: '', decimalDigits: 0).format(5000)} AAMP',
                    'รับคะแนน ${NumberFormat.currency(locale: 'th', symbol: '', decimalDigits: 0).format(500)} AAMP',
                  ];
                  final images = [
                    'assets/images/loan.svg',
                    'assets/images/person_phone.svg',
                  ];

                  return Container(
                    decoration: BoxDecoration(color: Colors.transparent),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  titles[index],
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  descriptions[index],
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(height: 11),
                                ElevatedButton(
                                  onPressed: () {
                                    Get.to(
                                      index == 1
                                          ? AgentReferralCode()
                                          : AgentInviteFriend(),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color.fromRGBO(
                                      121,
                                      42,
                                      255,
                                      0.75,
                                    ),
                                    shadowColor: Color.fromRGBO(
                                      121,
                                      42,
                                      255,
                                      0.45,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      vertical: 6,
                                      horizontal: 25,
                                    ),
                                  ),
                                  child: Text(
                                    'ชวนเพื่อน',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SvgPicture.asset(
                              images[index],
                              width: 120,
                              height: 78,
                            ),
                          ],
                        ),

                        SizedBox(height: 16),
                        Obx(
                          () => Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 12,
                                height: 4,
                                decoration: BoxDecoration(
                                  color:
                                      agentController
                                                  .selectedRecommendIndex
                                                  .value ==
                                              index
                                          ? Color.fromRGBO(121, 42, 255, 1)
                                          : Color.fromRGBO(121, 42, 255, 0.5),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              SizedBox(width: 4),
                              Icon(
                                Icons.circle,
                                size: 8,
                                color:
                                    agentController
                                                .selectedRecommendIndex
                                                .value ==
                                            index
                                        ? Color.fromRGBO(121, 42, 255, 0.5)
                                        : Color.fromRGBO(121, 42, 255, 1),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Color.fromRGBO(121, 42, 255, 0.08),
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: List.generate(3, (index) {
                    final steps = [desc1, desc2, desc3];
                    return Padding(
                      padding:
                          index == 2
                              ? EdgeInsets.zero
                              : const EdgeInsets.only(bottom: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${index + 1}.',
                            style: TextStyle(
                              color: Color.fromRGBO(121, 42, 255, 0.75),
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              steps[index],
                              style: TextStyle(
                                color: Color.fromRGBO(121, 42, 255, 1),
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
