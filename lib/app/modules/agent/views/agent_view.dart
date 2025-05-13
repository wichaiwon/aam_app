import 'package:aam_app/app/modules/widgets/agent_screen/benefits.dart';
import 'package:aam_app/app/modules/widgets/agent_screen/manage_button.dart';
import 'package:aam_app/app/modules/widgets/agent_screen/register_agent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AgentView extends StatelessWidget {
  const AgentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'เพิ่มรายได้',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
              ),
              SvgPicture.asset(
                'assets/images/exclamation-circle.svg',
                width: 24,
                height: 24,
              ),
            ],
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        color: Colors.white,
        child: Column(
          children: [
            ManageButton(
              loan: 'จัดการสินเชื่อ',
              countLoan: 0,
              download: 'ดาวน์โหลดแอพ',
              countDownload: 0,
            ),
            SizedBox(height: 16),
            RegisterAgent(
              comeToBeAgent: 'มาเป็นตัวแทนแนะนำกับเรา',
              comeToBeAgentDesc:
                  'มาร่วมเป็นตัวแทนกับเรา รับสิทธิประโยชน์ก่อน\nใครสร้างรายได้ ไม่มีผูกมัด',
              registerButton: 'สมัครลงทะเบียน',
            ),
            SizedBox(height: 16),
            Benefits(
              desc1: 'สมัครเป็นตัวแทนแนะนำเพื่อนกับเรา',
              desc2:
                  'ร่วมทำกิจกรรม พร้อมสะสมคะแนนเพื่อรับสิทธิประโยชน์มากมาย แบบไม่ผูกมัด',
              desc3: 'ยิ่งแนะนำมาก ก็ยิ่งได้มาก เพิ่มรายได้ให้กับคุณ',
            ),
          ],
        ),
      ),
    );
  }
}
