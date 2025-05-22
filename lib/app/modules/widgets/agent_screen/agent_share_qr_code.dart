import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AgentShareQrCode extends StatelessWidget {
  const AgentShareQrCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close, size: 20),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'QR ตัวแทนแนะนำ',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/qr_code.png',
                        width: 200,
                        height: 200,
                      ),
                      SizedBox(height: 16),
                      Text(
                        'ส่ง QR แนะนำนี้ให้เพื่อนของคุณสแกน\nเพื่อเข้าสู่ระบบการแนะนำเพื่อน',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(26, 24, 24, 0.35),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // ถ้ามีปุ่มหรืออย่างอื่นที่อยากแสดงด้านล่าง
              Padding(
                padding: EdgeInsets.only(bottom: 48, left: 24, right: 24),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        vertical: 6,
                        horizontal: 16,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromRGBO(121, 42, 255, 0.08),
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'รหัสตัวแทนแนะนำ',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(121, 42, 255, 1),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'DSF735',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color.fromRGBO(121, 42, 255, 1),
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.copy_outlined,
                                  size: 16,
                                  color: Color.fromRGBO(121, 42, 255, 1),
                                ),
                                onPressed: () {
                                  // ฟังก์ชันสำหรับแชร์ QR Code
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(249, 249, 249, 1),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.download_outlined,
                                color: Color.fromRGBO(153, 93, 254, 1),
                              ),
                            ),
                          ),
                          SizedBox(width: 19),
                          Expanded(
                            child: TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                backgroundColor: Color.fromRGBO(
                                  153,
                                  93,
                                  254,
                                  1,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                padding: EdgeInsets.symmetric(vertical: 14),
                              ),
                              child: Text(
                                'แชร์',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
