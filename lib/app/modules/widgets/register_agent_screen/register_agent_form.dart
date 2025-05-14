import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterAgentForm extends StatefulWidget {
  const RegisterAgentForm({super.key});

  @override
  _RegisterAgentFormState createState() => _RegisterAgentFormState();
}

class _RegisterAgentFormState extends State<RegisterAgentForm> {
  // final TextEditingController _fullNameController = TextEditingController();
  // final TextEditingController _idCardNumberController = TextEditingController();

  bool isChecked = false; // สถานะของ checkbox

  // @override
  // void dispose() {
  //   _fullNameController.dispose();
  //   _idCardNumberController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: IconButton(
            icon: Icon(Icons.close, size: 24),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        title: Text(
          'สมัครเป็นตัวแทนแนะนำ',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'ชื่อ-นามสกุล',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                  GestureDetector(
                    onTap: () {
                      // final pickedFile = await ImagePicker().pickImage(
                      //   source: ImageSource.camera,
                      // );
                      // if (pickedFile != null) {
                      //   final inputImage = InputImage.fromFilePath(
                      //     pickedFile.path,
                      //   );
                      //   final textRecognizer =
                      //       GoogleMlKit.vision.textRecognizer();
                      //   final RecognizedText recognizedText =
                      //       await textRecognizer.processImage(inputImage);

                      //   String fullName = '';
                      //   String idCardNumber = '';

                      //   for (TextBlock block in recognizedText.blocks) {
                      //     for (TextLine line in block.lines) {
                      //       if (line.text.contains(
                      //         RegExp(r'^\d{1}-\d{4}-\d{5}-\d{2}-\d{1}$'),
                      //       )) {
                      //         idCardNumber = line.text;
                      //       } else if (line.text.contains('นาย') ||
                      //           line.text.contains('นาง') ||
                      //           line.text.contains('นางสาว')) {
                      //         fullName += line.text;
                      //       }
                      //     }
                      //   }
                      //   textRecognizer.close();
                      //   setState(() {
                      //     _fullNameController.text = fullName;
                      //     _idCardNumberController.text = idCardNumber;
                      //   });
                      // }
                    },
                    child: SvgPicture.asset(
                      'assets/images/scan_id_card.svg',
                      width: 26,
                      height: 26,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            TextField(
              // controller: _fullNameController,
              decoration: InputDecoration(
                hintText: 'กรุณากรอกชื่อ-นามสกุล',
                contentPadding: EdgeInsets.all(14),
                hintStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(26, 24, 24, 0.35),
                ),
                fillColor: Color.fromRGBO(245, 245, 245, 1),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 14),
            Text(
              'เลขบัตรประชาชน',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 10),
            TextField(
              // controller: _idCardNumberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(14),
                hintText: '0-0000-00-000-00-0',
                hintStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(26, 24, 24, 0.35),
                ),
                fillColor: Color.fromRGBO(245, 245, 245, 1),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 14),
            Text(
              'เบอร์โทรศัพท์',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 10),
            TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(14),
                hintText: '081-234-5678',
                hintStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(26, 24, 24, 0.35),
                ),
                fillColor: Color.fromRGBO(245, 245, 245, 1),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 14),
            Text(
              'อาชีพ',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(14),
                hintText: 'กรุณากรอกอาชีพ',
                hintStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(26, 24, 24, 0.35),
                ),
                fillColor: Color.fromRGBO(245, 245, 245, 1),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 38),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/images/line.svg', height: 42),
                    SizedBox(width: 12),
                    Text(
                      'สมัครเป็นตัวแทนกับ เอเอเอ็ม จัดไฟแนนซ์\nกรุณากดยอมรับเนื้อหาต่อไปนี้',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    // Navigate to terms and conditions page
                  },

                  child: Text(
                    'เพื่อความปลอดภัยต่อข้อมูลของคุณ ในการให้บริการ \nกรุณากดยอมรับข้อตกลงด้านล่าง เพื่อดำเนินการต่อ',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(26, 24, 24, 0.5),
                    ),
                  ),
                ),
                SizedBox(height: 18),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Transform.translate(
                      offset: Offset(-14, 0),
                      child: Checkbox(
                        value: isChecked,
                        onChanged: (value) {
                          setState(() {
                            isChecked =
                                value!; // อัปเดตสถานะเมื่อมีการเปลี่ยนแปลง
                          });
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        side: BorderSide(
                          color: Color.fromRGBO(121, 42, 255, 0.25),
                          width: 1,
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(-14, 0),
                      child: Text(
                        'ยอมรับข้อตกลงการให้บริการ',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {},
                  child: Icon(Icons.chevron_right, size: 20),
                ),
              ],
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 52),
                backgroundColor:
                    !isChecked
                        ? Color.fromRGBO(26, 24, 24, 0.15)
                        : Color.fromRGBO(153, 93, 254, 1),
              ),
              child: Text(
                'สมัคร',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
