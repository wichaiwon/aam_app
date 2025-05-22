import 'package:aam_app/app/modules/agent/controllers/agent_controller.dart';
import 'package:aam_app/app/modules/widgets/agent_screen/agent_point.dart';
import 'package:aam_app/app/modules/widgets/agent_screen/agent_profile.dart';
import 'package:aam_app/app/modules/widgets/agent_screen/agent_recommend.dart';
import 'package:aam_app/app/modules/widgets/agent_screen/benefits.dart';
import 'package:aam_app/app/modules/widgets/agent_screen/manage_button.dart';
import 'package:aam_app/app/modules/widgets/agent_screen/register_agent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AgentView extends StatelessWidget {
  const AgentView({super.key});

  @override
  Widget build(BuildContext context) {
    final AgentController agentController = Get.find<AgentController>();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: agentController.registedAgent ? false : true,
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'เพิ่มรายได้',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
              ),
              IconButton(
                onPressed: () {
                  Get.bottomSheet(
                    Container(
                      width: double.infinity,
                      height: 364,
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: 40,
                            height: 4,
                            margin: EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(200, 200, 200, 1),
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          SizedBox(height: 16),
                          SvgPicture.asset(
                            'assets/images/loan.svg',
                            width: 70,
                            height: 70,
                          ),
                          SizedBox(height: 16),
                          Text(
                            'สิทธิพิเศษสำหรับผู้แนะนำ',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            textAlign: TextAlign.center,
                            'เพียงแค่..ร่วมสนุกกับกิจกรรมแนะนำเพื่อนกับ เอเอเอ็ม คุณก็สามารถสร้างรายได้ ได้แบบง่ายๆและไม่มีข้อผูกมัด ยิ่งแนะนำมาก ก็ยิ่งได้มาก',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(153, 153, 153, 1),
                            ),
                          ),
                          SizedBox(height: 26),
                          ElevatedButton(
                            onPressed: () {
                              Get.back();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromRGBO(161, 105, 255, 1),
                              minimumSize: Size(double.infinity, 0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 12),
                            ),
                            child: Text(
                              'เข้าใจแล้ว',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                icon: SvgPicture.asset(
                  'assets/images/exclamation-circle.svg',
                  width: 24,
                  height: 24,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          color: Colors.white,
          child: Column(
            children: [
              agentController.registedAgent
                  ? AgentProfile(
                    contractName: 'AAMMR01',
                    textButton: 'CLASSIC',

                    referral: 'ผู้แนะนำ',
                  )
                  : SizedBox.shrink(),
              ManageButton(
                loan: 'จัดการสินเชื่อ',
                download: 'ดาวน์โหลดแอพ',
                waitLoan: 'รอสินเชื่อ',
                closeLoan: 'ปิดได้',
              ),
              agentController.registedAgent
                  ? SizedBox.shrink()
                  : RegisterAgent(
                    comeToBeAgent: 'มาเป็นตัวแทนแนะนำกับเรา',
                    comeToBeAgentDesc:
                        'มาร่วมเป็นตัวแทนกับเรา รับสิทธิประโยชน์ก่อน\nใครสร้างรายได้ ไม่มีผูกมัด',
                    registerButton: 'สมัครลงทะเบียน',
                  ),
              agentController.registedAgent
                  ? SizedBox.shrink()
                  : Benefits(
                    desc1: 'สมัครเป็นตัวแทนแนะนำเพื่อนกับเรา',
                    desc2:
                        'ร่วมทำกิจกรรม พร้อมสะสมคะแนนเพื่อรับสิทธิประโยชน์มากมาย แบบไม่ผูกมัด',
                    desc3: 'ยิ่งแนะนำมาก ก็ยิ่งได้มาก เพิ่มรายได้ให้กับคุณ',
                  ),
              agentController.registedAgent ? AgentPoint() : SizedBox.shrink(),
              agentController.registedAgent
                  ? AgentRecommend(
                    desc1: 'แนะนำเพื่อนมาจัดสินเชื่อ รับคะแนน 500 AAMP',
                    desc2: 'รอติดตามว่าเพื่อนที่แนะนำ เข้าร่วมกิจกรรมหรือไม่?',
                    desc3:
                        'ถ้าเพื่อนที่เราแนะนำ สามารถจัดสินเชื่อกับเราได้ ได้รับคะแนนเพิ่มไปอีก 5,000 AAMP',
                  )
                  : SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
