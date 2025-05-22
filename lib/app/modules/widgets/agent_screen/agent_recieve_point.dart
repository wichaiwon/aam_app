import 'package:aam_app/app/modules/agent/controllers/agent_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class AgentRecievePoint extends StatefulWidget {
  const AgentRecievePoint({super.key});

  @override
  State<AgentRecievePoint> createState() => _AgentRecievePointState();
}

class _AgentRecievePointState extends State<AgentRecievePoint> {
  AgentController agentController = AgentController();
  @override
  void initState() {
    super.initState();
    initializeDateFormatting('th');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'คะแนนที่ได้รับ',
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
                              'คะแนน AAMP ที่ได้รับ',
                              style: TextStyle(
                                color: Color.fromRGBO(26, 24, 24, 0.5),
                              ),
                            ),
                            SizedBox(height: 4),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/images/aam_coin.svg',
                                  width: 24,
                                  height: 24,
                                ),
                                SizedBox(width: 6),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      agentController.loanAmount.value += 500;
                                    });
                                  },
                                  child: Text(
                                    NumberFormat.decimalPattern().format(
                                      agentController.loanAmount.value,
                                    ),
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 24),
                      agentController.loanAmount.value > 0
                          ? Column(
                            children: [
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
                                      color: Color.fromRGBO(26, 24, 24, 0.5),
                                    ),
                                  ),
                                  border: InputBorder.none,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(32),
                                    borderSide: BorderSide(
                                      color: Color.fromRGBO(26, 24, 24, 0.1),
                                      width: 1,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                      color: Color.fromRGBO(26, 24, 24, 0.3),
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
                              SizedBox(height: 16),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount:
                                    (agentController.loanAmount.value / 500)
                                        .toInt(),

                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      if (index % 3 == 0)
                                        Row(
                                          children: [
                                            Text(
                                              DateFormat(
                                                'd MMM yy',
                                                'th',
                                              ).format(
                                                DateTime.now().subtract(
                                                  Duration(days: index),
                                                ),
                                              ),
                                              style: TextStyle(fontSize: 14),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 12,
                                                    ),
                                                child: Divider(
                                                  color: Color.fromRGBO(
                                                    26,
                                                    24,
                                                    24,
                                                    0.08,
                                                  ),
                                                  thickness: 1,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      SizedBox(height: 14),
                                      Container(
                                        padding: EdgeInsets.all(16),
                                        margin: EdgeInsets.only(bottom: 16),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                            16,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color.fromRGBO(
                                                0,
                                                0,
                                                0,
                                                0.1,
                                              ),
                                              blurRadius: 4,
                                              offset: Offset(0, 2),
                                            ),
                                          ],
                                        ),
                                        child: Row(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(24),
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
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        (index % 3 == 0
                                                            ? 'รอจัดสินเชื่อ'
                                                            : index % 3 == 1
                                                            ? 'จัดสินเชื่อสำเร็จ'
                                                            : 'ชวนเพื่อนดาวน์โหลดแอพ'),
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                      SizedBox(height: 4),
                                                      Text(
                                                        '12:00',
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          color: Color.fromRGBO(
                                                            26,
                                                            24,
                                                            24,
                                                            0.35,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        '+${NumberFormat.decimalPattern().format(500)}',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Color.fromRGBO(
                                                            121,
                                                            42,
                                                            255,
                                                            0.75,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(height: 4),
                                                      Text(
                                                        'Friend ${index + 1}',
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          color: Color.fromRGBO(
                                                            26,
                                                            24,
                                                            24,
                                                            0.35,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ],
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
          ],
        ),
      ),
    );
  }
}
