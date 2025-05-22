import 'package:aam_app/app/modules/agent/controllers/agent_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:intl/intl.dart';

class AgentLoanHistory extends StatefulWidget {
  const AgentLoanHistory({super.key});

  @override
  State<AgentLoanHistory> createState() => _AgentLoanHistoryState();
}

class _AgentLoanHistoryState extends State<AgentLoanHistory> {
  AgentController agentController = AgentController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'จัดสินเชื่อ',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Color.fromRGBO(26, 24, 24, 1),
          ),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.keyboard_arrow_left_outlined, size: 36),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(bottom: 24),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      SizedBox(height: 14),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'แนะนำเพื่อนไปแล้ว',
                              style: TextStyle(
                                color: Color.fromRGBO(26, 24, 24, 0.5),
                              ),
                            ),
                            SizedBox(height: 4),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  agentController.loanCount.value += 2;
                                });
                              },
                              child: Text(
                                NumberFormat.decimalPattern().format(
                                  agentController.loanCount.value,
                                ),
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 24),
                      agentController.loanCount.value > 0
                          ? Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                  color: Color.fromRGBO(26, 24, 24, 0.1),
                                ),
                              ),
                            ),
                            child: Column(
                              children: [
                                SizedBox(height: 10),
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'รอจัดสินเชื่อ',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Obx(
                                          () =>
                                              agentController.loanCount.value >
                                                      0
                                                  ? Text(
                                                    NumberFormat.decimalPattern()
                                                        .format(
                                                          agentController
                                                                  .loanCount
                                                                  .value /
                                                              2,
                                                        ),
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  )
                                                  : SizedBox.shrink(),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'ปิดได้',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Obx(
                                          () =>
                                              agentController.loanCount.value >
                                                      0
                                                  ? Text(
                                                    NumberFormat.decimalPattern()
                                                        .format(
                                                          agentController
                                                                  .loanCount
                                                                  .value /
                                                              2,
                                                        ),
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  )
                                                  : SizedBox.shrink(),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 16),
                                    TextField(
                                      decoration: InputDecoration(
                                        hintText: 'ค้นหา',
                                        prefixIcon: Padding(
                                          padding: EdgeInsets.only(
                                            left: 16,
                                            right: 8,
                                          ),
                                          child: Icon(
                                            Icons.search,
                                            color: Color.fromRGBO(
                                              26,
                                              24,
                                              24,
                                              0.5,
                                            ),
                                          ),
                                        ),
                                        border: InputBorder.none,
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            32,
                                          ),
                                          borderSide: BorderSide(
                                            color: Color.fromRGBO(
                                              26,
                                              24,
                                              24,
                                              0.1,
                                            ),
                                            width: 1,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                          borderSide: BorderSide(
                                            color: Color.fromRGBO(
                                              26,
                                              24,
                                              24,
                                              0.3,
                                            ),
                                            width: 1.5,
                                          ),
                                        ),
                                        contentPadding: EdgeInsets.symmetric(
                                          vertical: 12,
                                          horizontal: 24,
                                        ),
                                      ),
                                      onChanged: (value) {
                                        // TODO: Implement search logic
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(height: 16),
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: agentController.loanCount.value,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      padding: EdgeInsets.all(16),
                                      margin: EdgeInsets.only(bottom: 16),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(16),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color.fromRGBO(0, 0, 0, 0.1),
                                            blurRadius: 4,
                                            offset: Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      child: Row(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              24,
                                            ),
                                            child: Image.asset(
                                              'assets/images/profile${(index % 5) + 1}.png',
                                              width: 46,
                                              height: 46,
                                            ),
                                          ),

                                          SizedBox(width: 16),
                                          Expanded(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Friend ${index + 1}',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                    SizedBox(height: 4),
                                                    Text(
                                                      'AAMMR00 ${index + 1}',
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: Color.fromRGBO(
                                                          26,
                                                          24,
                                                          24,
                                                          0.2,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                    vertical: 2,
                                                    horizontal: 4,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          6,
                                                        ),
                                                    color:
                                                        (index % 3 == 0
                                                            ? Color.fromRGBO(
                                                              255,
                                                              247,
                                                              205,
                                                              1,
                                                            )
                                                            : index % 3 == 1
                                                            ? Color.fromRGBO(
                                                              233,
                                                              255,
                                                              227,
                                                              1,
                                                            )
                                                            : Color.fromRGBO(
                                                              255,
                                                              230,
                                                              231,
                                                              1,
                                                            )),
                                                  ),
                                                  child: Text(
                                                    (index % 3 == 0
                                                        ? 'รอจัดสินเชื่อ'
                                                        : index % 3 == 1
                                                        ? 'ปิดได้'
                                                        : 'ปิดไม่ได้'),
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color:
                                                          (index % 3 == 0
                                                              ? Color.fromRGBO(
                                                                255,
                                                                147,
                                                                0,
                                                                1,
                                                              )
                                                              : index % 3 == 1
                                                              ? Color.fromRGBO(
                                                                52,
                                                                199,
                                                                111,
                                                                1,
                                                              )
                                                              : Color.fromRGBO(
                                                                255,
                                                                59,
                                                                48,
                                                                1,
                                                              )),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          )
                          : Container(
                            width: double.infinity,
                            padding: EdgeInsets.only(top: 34),
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                  color: Color.fromRGBO(26, 24, 24, 0.1),
                                ),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/images/exclamation_mark.svg',
                                  width: 37,
                                  height: 40,
                                ),
                                SizedBox(height: 14),
                                Text(
                                  'ยังไม่มีข้อมูลรายชื่อเพื่อนทที่คุณแนะนำ',
                                  style: TextStyle(
                                    color: Color.fromRGBO(26, 24, 24, 0.35),
                                  ),
                                ),
                              ],
                            ),
                          ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(24, 12, 24, 24),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    agentController.loanCount.value > 0
                        ? SizedBox.shrink()
                        : Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Color.fromRGBO(121, 42, 255, 0.08),
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.info_outline,
                                size: 20,
                                color: Color.fromRGBO(153, 93, 254, 1),
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  'แค่แนะนำเพื่อนครั้ง รับคะแนน 500 AAMP ทันทีและลุ้นรับต่ออีก ถ้าเพื่อนของคุณเข้าร่วมกิจกรรม',
                                  style: TextStyle(
                                    color: Color.fromRGBO(121, 42, 255, 0.75),
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                    SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(153, 93, 254, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 16),
                        ),
                        onPressed: () {},
                        child: Text(
                          'ชวนเพื่อน',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
