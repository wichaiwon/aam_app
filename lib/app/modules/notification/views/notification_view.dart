import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:permission_handler/permission_handler.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  MobileScannerController cameraController = MobileScannerController();
  bool _isCameraPermissionGranted = false;
  bool _isScanning = false;
  String? _scannedData;
  bool _isTorchOn = false;
  CameraFacing _cameraFacing = CameraFacing.back;

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
              appBar: AppBar(
                title: const Text('สแกนบาร์โค้ด'),
                actions: [
                  IconButton(
                    icon: Icon(
                      _isTorchOn ? Icons.flash_on : Icons.flash_off,
                      color: _isTorchOn ? Colors.yellow : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _isTorchOn = !_isTorchOn;
                      });
                      cameraController.toggleTorch();
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      _cameraFacing == CameraFacing.front
                          ? Icons.camera_front
                          : Icons.camera_rear,
                    ),
                    onPressed: () {
                      setState(() {
                        _cameraFacing =
                            _cameraFacing == CameraFacing.front
                                ? CameraFacing.back
                                : CameraFacing.front;
                      });
                      cameraController.switchCamera();
                    },
                  ),
                ],
              ),
              body: MobileScanner(
                controller: cameraController,
                onDetect: (capture) {
                  final List<Barcode> barcodes = capture.barcodes;
                  for (final barcode in barcodes) {
                    setState(() {
                      _scannedData = barcode.rawValue;
                    });
                    Navigator.pop(context);
                    break;
                  }
                },
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

  void _startTextScan() {
    // ฟังก์ชันสำหรับสแกนข้อความ (OCR) จะเพิ่มในภายหลัง
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('ฟังก์ชันสแกนข้อความจะเพิ่มในภายหลัง')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('สแกนบัตรประชาชน')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'ชื่อ-นามสกุล',
                border: OutlineInputBorder(),
              ),
              controller: TextEditingController(text: _scannedData),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                labelText: 'เลขบัตรประชาชน',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _isScanning ? null : _startBarcodeScan,
                  child: const Text('สแกนบาร์โค้ด'),
                ),
                ElevatedButton(
                  onPressed: _startTextScan,
                  child: const Text('สแกนข้อความ'),
                ),
              ],
            ),
            if (!_isCameraPermissionGranted)
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  'ต้องการอนุญาตใช้งานกล้องสำหรับการสแกน',
                  style: TextStyle(color: Colors.red),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
