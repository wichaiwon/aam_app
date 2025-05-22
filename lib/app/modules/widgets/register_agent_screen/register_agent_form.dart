import 'package:aam_app/app/modules/widgets/register_agent_screen/register_agent_success.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:permission_handler/permission_handler.dart';

class RegisterAgentForm extends StatefulWidget {
  const RegisterAgentForm({super.key});

  @override
  _RegisterAgentFormState createState() => _RegisterAgentFormState();
}

class ScannerOverlayPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = Color.fromRGBO(161, 105, 255, 0.8)
          ..style = PaintingStyle.fill;

    const holeSize = Size(280, 186);
    final topOffset = 100.0;
    final holeRect = Rect.fromLTWH(
      (size.width - holeSize.width) / 2,
      topOffset,
      holeSize.width,
      holeSize.height,
    );

    final fullRect = Offset.zero & size;

    final path =
        Path()
          ..addRect(fullRect)
          ..addRRect(RRect.fromRectXY(holeRect, 35, 35))
          ..fillType = PathFillType.evenOdd;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _RegisterAgentFormState extends State<RegisterAgentForm> {
  MobileScannerController cameraController = MobileScannerController();
  bool _isCameraPermissionGranted = false;
  bool _isScanning = false;
  String? _scannedData;
  bool _isTorchOn = false;
  CameraFacing _cameraFacing = CameraFacing.back;

  final _formKey = GlobalKey<FormState>();
  bool isChecked = false;

  String _name = '';
  String _idCard = '';
  String _phone = '';
  String _job = '';

  @override
  void initState() {
    super.initState();
    _checkCameraPermission();
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  Future<void> _checkCameraPermission() async {
    final status = await Permission.camera.status;
    setState(() {
      _isCameraPermissionGranted = status.isGranted;
    });
  }

  Future<void> _requestCameraPermission() async {
    final status = await Permission.camera.request();
    setState(() {
      _isCameraPermissionGranted = status.isGranted;
    });
  }

  void _startBarcodeScan() async {
    if (!_isCameraPermissionGranted) {
      await _requestCameraPermission();
      if (!_isCameraPermissionGranted) return;
    }

    setState(() {
      _isScanning = true;
    });

    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => Scaffold(
              body: Stack(
                children: [
                  Stack(
                    children: [
                      MobileScanner(
                        controller: cameraController,
                        onDetect: (capture) {
                          final List<Barcode> barcodes = capture.barcodes;
                          for (final barcode in barcodes) {
                            if (barcode.rawValue != null) {
                              setState(() {
                                _scannedData = barcode.rawValue;
                              });
                              Navigator.pop(
                                context,
                                barcode.rawValue,
                              ); // ส่งค่ากลับ
                              break;
                            }
                          }
                        },
                      ),
                      CustomPaint(
                        size: Size(
                          MediaQuery.of(context).size.width,
                          MediaQuery.of(context).size.height,
                        ),
                        painter: ScannerOverlayPainter(),
                      ),
                      Container(
                        height: double.infinity,
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                SizedBox(height: 30),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.chevron_left_outlined),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                    Text(
                                      'สแกนบัตรประชาชน',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        Icons.chevron_right_outlined,
                                        color: Colors.transparent,
                                      ),
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Icon(
                                  Icons.circle_outlined,
                                  size: 32,
                                  color: Colors.white,
                                ),
                                SizedBox(height: 75),
                                Text(
                                  'กรุณาสแกนบัตรประชาชนของคุณ',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(height: 90),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
      ),
    ).then((_) {
      setState(() {
        _isScanning = false;
        _isTorchOn = false;
      });
    });
  }

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
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(color: Colors.white),
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: _formKey,
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
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _isScanning ? null : _startBarcodeScan();
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
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกชื่อ-นามสกุล';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _name = value!;
                  },
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
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกเลขบัตรประชาชน';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _idCard = value!;
                  },
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
                  controller: TextEditingController(text: _scannedData),
                ),
                SizedBox(height: 14),
                Text(
                  'เบอร์โทรศัพท์',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 10),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกเบอร์โทรศัพท์';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _phone = value!;
                  },
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
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกอาชีพ';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _job = value!;
                  },
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
                      onTap: () {},

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
                                isChecked = value!;
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
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      if (isChecked) {
                        Get.to(RegisterAgentSuccess());
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('กรุณายอมรับข้อตกลงการให้บริการ'),
                          ),
                        );
                      }
                    }
                  },
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
        ),
      ),
    );
  }
}
