import 'package:aam_app/app/modules/agent/controllers/agent_controller.dart';
import 'package:flutter/material.dart';
import 'package:aam_app/app/modules/notifications/controllers/notification_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NotificationView extends StatefulWidget {
  @override
  _NotificationViewState createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  final NotificationController controller = NotificationController();
  AgentController agentController = AgentController();
  final PageController _pageController = PageController();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _provinceController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _insuranceTypeController =
      TextEditingController();

  @override
  void dispose() {
    _pageController.dispose();
    _nameController.dispose();
    _surnameController.dispose();
    _phoneController.dispose();
    _provinceController.dispose();
    _districtController.dispose();
    _insuranceTypeController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ชวนเพื่อน'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.chevron_left_outlined, size: 28),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 24),
            child: SvgPicture.asset(
              'assets/images/invite_friend.svg',
              width: 106,
              height: 48,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.info_outline,
                    color: Color.fromRGBO(153, 93, 254, 1),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'สะสมคะแนน จากกิจกรรมแนะนำ เพื่อเพิ่มระดับตัวแทนของคุณ และรับสิทธิประโชยน์ที่มากกว่า',
                      style: TextStyle(color: Color.fromRGBO(26, 24, 24, 0.5)),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text(
                'จะชวนเพื่อนำอะไรดี?',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 16),
              Text('กิจกรรมแนะนำ'),
              SizedBox(height: 8),
              GestureDetector(
                onTap: () {
                  agentController.isBottomSheetOpen.value = true;
                  Get.bottomSheet(
                    Container(
                      padding: EdgeInsets.only(left: 24, right: 24, bottom: 50),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(16),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
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
                          ...[
                            {
                              'title': 'จัดสินเชื่อ',
                              'points':
                                  'รับคะแนนสะสมสูงสุด ${NumberFormat.currency(symbol: '', decimalDigits: 0).format(5000)} AAMP',
                              'icon': 'assets/images/file.svg',
                            },
                            {
                              'title': 'ต่อประกันภัย',
                              'points':
                                  'รับคะแนนสะสมสูงสุด ${NumberFormat.currency(symbol: '', decimalDigits: 0).format(5000)} AAMP',
                              'icon': 'assets/images/file.svg',
                            },
                          ].map(
                            (activity) => ListTile(
                              title: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(121, 42, 255, 0.05),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: SvgPicture.asset(activity['icon']!),
                                  ),
                                  SizedBox(width: 20),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        activity['title']!,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        activity['points']!,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Color.fromRGBO(
                                            153,
                                            153,
                                            153,
                                            1,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              onTap:
                                  () => agentController.selectActivity(
                                    activity['title']!,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ).whenComplete(() {
                    agentController.isBottomSheetOpen.value = false;
                  });
                },
                child: Obx(
                  () => Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(249, 249, 249, 1),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color:
                            agentController.isBottomSheetOpen.value
                                ? const Color.fromRGBO(121, 42, 255, 0.75)
                                : const Color.fromRGBO(26, 24, 24, 0.08),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(
                          () =>
                              agentController.selectedActivity.value ==
                                      'เลือกกิจกรรม'
                                  ? Text(
                                    agentController.selectedActivity.value,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromRGBO(153, 153, 153, 1),
                                    ),
                                  )
                                  : Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          color: Color.fromRGBO(
                                            121,
                                            42,
                                            255,
                                            0.05,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            16,
                                          ),
                                        ),
                                        child: SvgPicture.asset(
                                          'assets/images/file.svg',
                                          width: 24,
                                          height: 24,
                                        ),
                                      ),
                                      SizedBox(width: 20),
                                      Text(
                                        agentController.selectedActivity.value,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                        ),
                        Obx(
                          () => AnimatedRotation(
                            turns:
                                agentController.isBottomSheetOpen.value
                                    ? 0.5
                                    : 0.0,
                            duration: Duration(milliseconds: 200),
                            child: Icon(Icons.keyboard_arrow_down_outlined),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Obx(() {
                if (agentController.selectedActivity.value == 'ต่อประกันภัย') {
                  return SizedBox.shrink();
                }
                return Expanded(
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (index) {
                      controller.setCurrentPage(index);
                      setState(() {}); // To update button state
                    },
                    children: List.generate(
                      3,
                      (index) => Container(
                        decoration: BoxDecoration(),
                        child: Builder(
                          builder: (_) {
                            if (index == 0) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('ชื่อ'),
                                  SizedBox(height: 8),
                                  TextField(
                                    controller: _nameController,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'กรอกชื่อ',
                                    ),
                                    onChanged: (_) => setState(() {}),
                                  ),
                                  SizedBox(height: 16),
                                  Text('นามสกุล'),
                                  SizedBox(height: 8),
                                  TextField(
                                    controller: _surnameController,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'กรอกนามสกุล',
                                    ),
                                    onChanged: (_) => setState(() {}),
                                  ),
                                  SizedBox(height: 16),
                                  Text('เบอร์โทร'),
                                  SizedBox(height: 8),
                                  TextField(
                                    controller: _phoneController,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'กรอกเบอร์โทร',
                                    ),
                                    onChanged: (_) => setState(() {}),
                                  ),
                                ],
                              );
                            } else if (index == 1) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('จังหวัด'),
                                  SizedBox(height: 8),
                                  TextField(
                                    controller: _provinceController,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'กรอกจังหวัด',
                                    ),
                                    onChanged: (_) => setState(() {}),
                                  ),
                                  SizedBox(height: 16),
                                  Text('อำเภอ'),
                                  SizedBox(height: 8),
                                  TextField(
                                    controller: _districtController,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'กรอกอำเภอ',
                                    ),
                                    onChanged: (_) => setState(() {}),
                                  ),
                                ],
                              );
                            } else if (index == 2) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('ประเภทประกันภัย'),
                                  SizedBox(height: 8),
                                  TextField(
                                    controller: _insuranceTypeController,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'กรอกประเภทประกันภัย',
                                    ),
                                    onChanged: (_) => setState(() {}),
                                  ),
                                  SizedBox(height: 16),
                                  Text('แนบไฟล์'),
                                  SizedBox(height: 8),
                                  ElevatedButton.icon(
                                    onPressed: () async {
                                      // TODO: Implement file picker logic here
                                      // Example: Use file_picker package to pick a file
                                      // FilePickerResult? result = await FilePicker.platform.pickFiles();
                                      // if (result != null) {
                                      //   // Handle the selected file
                                      // }
                                    },
                                    icon: Icon(Icons.attach_file),
                                    label: Text('อัปโหลดไฟล์'),
                                    style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 16,
                                        horizontal: 24,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            } else {
                              return SizedBox.shrink();
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                );
              }),
              Builder(
                builder: (context) {
                  int page = controller.currentPage.value;
                  bool isEnabled = false;
                  // For file check, you may want to use a variable to store file state
                  // Here, just a placeholder for file picked
                  bool filePicked = false; // Replace with your file logic

                  if (page == 0) {
                    isEnabled =
                        _nameController.text.trim().isNotEmpty &&
                        _surnameController.text.trim().isNotEmpty &&
                        _phoneController.text.trim().isNotEmpty;
                  } else if (page == 1) {
                    isEnabled =
                        _provinceController.text.trim().isNotEmpty &&
                        _districtController.text.trim().isNotEmpty;
                  } else if (page == 2) {
                    isEnabled =
                        _insuranceTypeController.text.trim().isNotEmpty &&
                        filePicked;
                  }
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      controller.currentPage.value > 0
                          ? IconButton(
                            onPressed: () {
                              final prevPage = controller.currentPage.value - 1;
                              if (prevPage >= 0) {
                                _pageController.animateToPage(
                                  prevPage,
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                                controller.setCurrentPage(prevPage);
                                setState(() {});
                              }
                            },
                            icon: Icon(Icons.keyboard_arrow_left_outlined),
                          )
                          : SizedBox.shrink(),
                      Obx(() {
                        if (agentController.selectedActivity.value ==
                            'ต่อประกันภัย') {
                          return SizedBox.shrink();
                        }
                        return TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor:
                                isEnabled
                                    ? Color.fromRGBO(153, 93, 254, 1)
                                    : Color.fromRGBO(26, 24, 24, 0.15),
                            padding: EdgeInsets.symmetric(
                              vertical: 16,
                              horizontal: 32,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          onPressed:
                              isEnabled
                                  ? () {
                                    final nextPage =
                                        controller.currentPage.value + 1;
                                    if (nextPage < 3) {
                                      _pageController.animateToPage(
                                        nextPage,
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.easeInOut,
                                      );
                                      controller.setCurrentPage(nextPage);
                                      setState(() {});
                                    }
                                  }
                                  : null,
                          child: Text(
                            'ถัดไป',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        );
                      }),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
