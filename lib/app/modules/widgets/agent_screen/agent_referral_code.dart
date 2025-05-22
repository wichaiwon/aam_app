import 'package:aam_app/app/modules/agent/controllers/agent_controller.dart';
import 'package:aam_app/app/modules/widgets/register_agent_screen/register_agent_referral_code_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:permission_handler/permission_handler.dart';

class AgentReferralCode extends StatefulWidget {
  const AgentReferralCode({super.key});

  @override
  _AgentReferralCodeState createState() => _AgentReferralCodeState();
}

class _AgentReferralCodeState extends State<AgentReferralCode> {
  final TextEditingController _referralCodeController = TextEditingController();
  MobileScannerController cameraController = MobileScannerController();
  AgentController agentController = Get.find<AgentController>();
  bool _isCameraPermissionGranted = false;
  bool _isScanning = false;
  String? _scannedData;
  final GlobalKey qrKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _checkCameraPermission();
    _referralCodeController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _referralCodeController.dispose();
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

  void _startQRScan() async {
    if (_isCameraPermissionGranted) {
      await _requestCameraPermission();
      if (_isCameraPermissionGranted) return;
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
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(161, 105, 255, 1),
                          Color.fromRGBO(121, 42, 255, 1),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Container(
                      height: double.infinity,
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              SizedBox(height: 56),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(255, 255, 255, 0.7),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: IconButton(
                                      icon: Icon(Icons.chevron_left, size: 32),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                  Text(
                                    'สแกน QR Code',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.qr_code_scanner_outlined,
                                      color: Colors.transparent,
                                      size: 24,
                                    ),
                                    onPressed: () {
                                      // Add your QR code scanner logic here
                                    },
                                  ),
                                ],
                              ),
                              SizedBox(height: 70),
                              Container(
                                width: 280,
                                height: 280,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(18),
                                  border: Border.all(
                                    width: 1,
                                    color: Color.fromRGBO(255, 255, 255, 0.5),
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(18),
                                  child: MobileScanner(
                                    controller: cameraController,
                                    onDetect: (capture) {
                                      final List<Barcode> barcodes =
                                          capture.barcodes;
                                      for (final barcode in barcodes) {
                                        if (barcode.rawValue != null) {
                                          setState(() {
                                            _referralCodeController.text =
                                                barcode.rawValue!;
                                            _scannedData = barcode.rawValue;
                                          });
                                          Navigator.pop(
                                            context,
                                            barcode.rawValue,
                                          );
                                          break;
                                        }
                                      }
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(height: 219),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 68),
                                decoration: BoxDecoration(),
                                child: Text(
                                  textAlign: TextAlign.center,
                                  'วางตำแหน่ง OR Code ให้อยู่ในกรอบเพื่อทำการสแกน',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: 8),
          child: Text('รหัสผู้แนะนำ'),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.chevron_left, size: 24),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: IconButton(
              icon: Icon(Icons.qr_code_scanner_outlined, size: 24),
              onPressed: () {
                _startQRScan();
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(height: 36),
                Center(
                  child: SvgPicture.asset(
                    'assets/images/scan_qr_code.svg',
                    width: 35,
                    height: 35,
                  ),
                ),
                SizedBox(height: 34),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 60),
                  child: Text(
                    textAlign: TextAlign.center,
                    'เพิ่มรหัสแนะนำ จากคนที่คุณถูกแนะนำมาเพื่อรับรางวัลเพิ่มเติม',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(26, 24, 24, 0.5),
                    ),
                  ),
                ),
                SizedBox(height: 34),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Color.fromRGBO(26, 24, 24, 0.2),
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TextFormField(
                    controller: _referralCodeController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: 'กรอกรหัสแนะนำ',
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(26, 24, 24, 0.5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                TextButton(
                  onPressed: () {
                    agentController.setReferralCode(
                      _referralCodeController.text,
                    );
                    Get.to(RegisterAgentReferralCodeSuccess());
                  },
                  style: TextButton.styleFrom(
                    minimumSize: Size(double.infinity, 52),
                    backgroundColor:
                        _referralCodeController.text.isNotEmpty
                            ? Color.fromRGBO(153, 93, 254, 1)
                            : Color.fromRGBO(26, 24, 24, 0.15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Text(
                    'ถัดไป',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(height: 48),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
