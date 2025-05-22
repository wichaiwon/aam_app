import 'package:aam_app/app/modules/agent/controllers/agent_controller.dart';
import 'package:aam_app/app/modules/widgets/register_agent_screen/register_agent_invite_friend_success.dart';
import 'package:aam_app/app/services/district.dart';
import 'package:aam_app/app/services/province.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'dart:io';

class AgentInviteFriend extends StatefulWidget {
  @override
  _AgentInviteFriendState createState() => _AgentInviteFriendState();
}

class _AgentInviteFriendState extends State<AgentInviteFriend> {
  AgentController agentController = Get.find<AgentController>();
  final PageController _pageController = PageController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _provinceController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _insuranceTypeController =
      TextEditingController();

  File? _imageFile;

  final ProvinceService _provinceService = ProvinceService();
  final DistrictService _districtService = DistrictService();
  List<Map<String, dynamic>> _provinces = [];
  List<Map<String, dynamic>> _districts = [];
  bool _isLoadingProvinces = true;
  bool _isLoadingDistricts = true;
  String? _selectedProvince;
  String? _selectedDistrict;
  int? _selectedProvinceId;

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
  void initState() {
    super.initState();
    _fetchProvinces();
    _fetchDistricts();
  }

  Future<void> _fetchProvinces() async {
    try {
      final provinces = await _provinceService.fetchProvinces();
      setState(() {
        _provinces = provinces;
        _isLoadingProvinces = false;
      });
    } catch (e) {
      setState(() {
        _isLoadingProvinces = false;
      });
    }
  }

  Future<void> _fetchDistricts() async {
    try {
      if (_selectedProvinceId != null) {
        final districts = await _districtService.fetchDistrictsByProvinceId(
          _selectedProvinceId!,
        );
        setState(() {
          _districts = districts;
          _isLoadingDistricts = false;
        });
      }
    } catch (e) {
      setState(() {
        _isLoadingDistricts = false;
      });
    }
  }

  void _onProvinceSelected(String? province) {
    setState(() {
      _selectedProvince = province;
      _selectedProvinceId =
          _provinces.firstWhere((p) => p['name'] == province)['id'] as int?;
      _districtController.clear();
    });
    _fetchDistricts();
  }

  void _onDistrictSelected(String? district) {
    setState(() {
      _selectedDistrict = district;
    });
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
                if (agentController.selectedActivity.value == 'เลือกกิจกรรม') {
                  return SizedBox.shrink();
                }
                return Expanded(
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (index) {
                      agentController.setInviteForm(index);
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
                                  GestureDetector(
                                    onTap: () async {
                                      FocusScope.of(context).unfocus();
                                      await showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(16),
                                          ),
                                        ),
                                        builder: (context) {
                                          return DraggableScrollableSheet(
                                            expand: false,
                                            initialChildSize: 0.5,
                                            minChildSize: 0.3,
                                            maxChildSize: 0.8,
                                            builder: (
                                              context,
                                              scrollController,
                                            ) {
                                              return Container(
                                                padding: EdgeInsets.all(16),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Text(
                                                      'เลือกจังหวัด',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    SizedBox(height: 8),
                                                    if (_isLoadingProvinces)
                                                      Center(
                                                        child:
                                                            CircularProgressIndicator(),
                                                      )
                                                    else
                                                      Expanded(
                                                        child: ListView(
                                                          controller:
                                                              scrollController,
                                                          children:
                                                              _provinces
                                                                  .map(
                                                                    (
                                                                      province,
                                                                    ) => ListTile(
                                                                      title: Text(
                                                                        province['name'],
                                                                      ),
                                                                      onTap: () {
                                                                        _onProvinceSelected(
                                                                          province['name'],
                                                                        );
                                                                        _provinceController.text =
                                                                            province['name'];
                                                                        Navigator.pop(
                                                                          context,
                                                                        );
                                                                        setState(
                                                                          () {},
                                                                        );
                                                                      },
                                                                    ),
                                                                  )
                                                                  .toList(),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      );
                                    },
                                    child: AbsorbPointer(
                                      child: TextField(
                                        controller:
                                            _provinceController
                                              ..text = _selectedProvince ?? '',
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: 'เลือกจังหวัด',
                                          suffixIcon: Icon(
                                            Icons.keyboard_arrow_down,
                                          ),
                                        ),
                                        readOnly: true,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  Text('อำเภอ'),
                                  SizedBox(height: 8),
                                  GestureDetector(
                                    onTap: () async {
                                      FocusScope.of(context).unfocus();
                                      if (_selectedProvinceId == null) return;
                                      await showModalBottomSheet(
                                        context: context,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(16),
                                          ),
                                        ),
                                        builder: (context) {
                                          return Container(
                                            padding: EdgeInsets.all(16),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  'เลือกอำเภอ',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                SizedBox(height: 8),
                                                if (_isLoadingDistricts)
                                                  Center(
                                                    child:
                                                        CircularProgressIndicator(),
                                                  )
                                                else
                                                  Expanded(
                                                    child: ListView(
                                                      children:
                                                          _districts
                                                              .map(
                                                                (
                                                                  district,
                                                                ) => ListTile(
                                                                  title: Text(
                                                                    district['name'],
                                                                  ),
                                                                  onTap: () {
                                                                    _onDistrictSelected(
                                                                      district['name'],
                                                                    );
                                                                    _districtController
                                                                            .text =
                                                                        district['name'];
                                                                    Navigator.pop(
                                                                      context,
                                                                    );
                                                                    setState(
                                                                      () {},
                                                                    );
                                                                  },
                                                                ),
                                                              )
                                                              .toList(),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: AbsorbPointer(
                                      child: TextField(
                                        controller:
                                            _districtController
                                              ..text = _selectedDistrict ?? '',
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: 'เลือกอำเภอ',
                                          suffixIcon: Icon(
                                            Icons.keyboard_arrow_down,
                                          ),
                                        ),
                                        readOnly: true,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            } else if (index == 2) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('ประเภทหลักประกัน'),
                                  SizedBox(height: 8),
                                  GestureDetector(
                                    onTap: () async {
                                      FocusScope.of(context).unfocus();
                                      final List<Map<String, String>>
                                      insuranceTypes = [
                                        {
                                          'name': 'รถยนต์',
                                          'description': '4 ล้อ, VAN, SUV',
                                          'icon': 'assets/images/car.svg',
                                        },
                                        {
                                          'name': 'รถบรรทุก',
                                          'description':
                                              '6 - 10 ล้อ , รถบรรทุกขนาดใหญ่',
                                          'icon': 'assets/images/truck.svg',
                                        },
                                        {
                                          'name': 'รถจักรยายนต์',
                                          'description': 'รถจักรยานยนต์ 2 ล้อ',
                                          'icon': 'assets/images/motocycle.svg',
                                        },
                                        {
                                          'name': 'ที่ดิน',
                                          'description':
                                              'ที่ดินเปล่า, ที่ดินพร้อมสิ่งปลูกสร้าง',
                                          'icon': 'assets/images/land.svg',
                                        },
                                      ];
                                      await showModalBottomSheet(
                                        context: context,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(16),
                                          ),
                                        ),
                                        builder: (context) {
                                          return Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 24,
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Container(
                                                  width: 40,
                                                  height: 4,
                                                  margin: EdgeInsets.symmetric(
                                                    vertical: 12,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: Color.fromRGBO(
                                                      200,
                                                      200,
                                                      200,
                                                      1,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          2,
                                                        ),
                                                  ),
                                                ),
                                                SizedBox(height: 16),
                                                ...insuranceTypes.map(
                                                  (type) => ListTile(
                                                    title: Row(
                                                      children: [
                                                        Container(
                                                          padding:
                                                              EdgeInsets.all(8),
                                                          decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                  12,
                                                                ),
                                                            color:
                                                                Color.fromRGBO(
                                                                  121,
                                                                  42,
                                                                  255,
                                                                  0.05,
                                                                ),
                                                          ),
                                                          child:
                                                              SvgPicture.asset(
                                                                type['icon']!,
                                                                width: 24,
                                                                height: 24,
                                                              ),
                                                        ),
                                                        SizedBox(width: 20),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              type['name']!,
                                                              style: TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                              ),
                                                            ),
                                                            SizedBox(height: 4),
                                                            Text(
                                                              type['description']!,
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color:
                                                                    Color.fromRGBO(
                                                                      26,
                                                                      24,
                                                                      24,
                                                                      0.5,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    onTap: () {
                                                      _insuranceTypeController
                                                          .text = type['name']!;
                                                      Navigator.pop(context);
                                                      setState(() {});
                                                    },
                                                  ),
                                                ),
                                                SizedBox(height: 60),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: AbsorbPointer(
                                      child: TextField(
                                        controller: _insuranceTypeController,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: 'เลือกประเภทหลักประกัน',
                                          suffixIcon: Icon(
                                            Icons.keyboard_arrow_down,
                                          ),
                                        ),
                                        readOnly: true,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  Text('รูปภาพหลักประกัน (ถ้ามี)'),
                                  SizedBox(height: 8),
                                  Row(
                                    children: [
                                      _imageFile != null
                                          ? Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 14,
                                              vertical: 15,
                                            ),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Color.fromRGBO(
                                                  26,
                                                  24,
                                                  24,
                                                  0.08,
                                                ),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                            child: Row(
                                              children: [
                                                Text(
                                                  'IMG${(_imageFile != null) ? (93).toString().padLeft(4, '0') : ''}',
                                                  style: TextStyle(
                                                    color: Color.fromRGBO(
                                                      26,
                                                      24,
                                                      24,
                                                      1,
                                                    ),
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                SizedBox(width: 8),
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      _imageFile = null;
                                                    });
                                                  },
                                                  child: Icon(
                                                    Icons.cancel,
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
                                          )
                                          : SizedBox.shrink(),
                                      _imageFile != null
                                          ? SizedBox(width: 8)
                                          : SizedBox.shrink(),
                                      TextButton(
                                        onPressed: () async {
                                          // แสดง bottom sheet ให้เลือก ถ่ายรูป หรือ อัพโหลดจากเครื่อง
                                          showModalBottomSheet(
                                            context: context,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                    top: Radius.circular(16),
                                                  ),
                                            ),
                                            builder: (context) {
                                              return Container(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 24,
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Container(
                                                      width: 40,
                                                      height: 4,
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                            vertical: 12,
                                                          ),
                                                      decoration: BoxDecoration(
                                                        color: Color.fromRGBO(
                                                          200,
                                                          200,
                                                          200,
                                                          1,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              2,
                                                            ),
                                                      ),
                                                    ),
                                                    SizedBox(height: 24),
                                                    ...[
                                                      {
                                                        'icon':
                                                            Icons
                                                                .camera_alt_outlined,
                                                        'label': 'ถ่ายรูป',
                                                        'onTap': () async {
                                                          Navigator.pop(
                                                            context,
                                                          );
                                                          final pickedFile =
                                                              await ImagePicker()
                                                                  .pickImage(
                                                                    source:
                                                                        ImageSource
                                                                            .camera,
                                                                  );
                                                          if (pickedFile !=
                                                              null) {
                                                            setState(() {
                                                              _imageFile = File(
                                                                pickedFile.path,
                                                              );
                                                            });
                                                          }
                                                        },
                                                      },
                                                      {
                                                        'icon':
                                                            Icons
                                                                .image_outlined,
                                                        'label':
                                                            'อัพโหลดจากเครื่อง',
                                                        'onTap': () async {
                                                          Navigator.pop(
                                                            context,
                                                          );
                                                          final pickedFile =
                                                              await ImagePicker()
                                                                  .pickImage(
                                                                    source:
                                                                        ImageSource
                                                                            .gallery,
                                                                  );
                                                          if (pickedFile !=
                                                              null) {
                                                            setState(() {
                                                              _imageFile = File(
                                                                pickedFile.path,
                                                              );
                                                            });
                                                          }
                                                        },
                                                      },
                                                    ].map(
                                                      (item) => GestureDetector(
                                                        onTap:
                                                            item['onTap']
                                                                as void
                                                                Function()?,
                                                        child: Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                bottom: 12,
                                                              ),
                                                          padding:
                                                              EdgeInsets.symmetric(
                                                                vertical: 12,
                                                              ),
                                                          decoration: BoxDecoration(
                                                            color:
                                                                Color.fromRGBO(
                                                                  121,
                                                                  42,
                                                                  255,
                                                                  0.08,
                                                                ),
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                  16,
                                                                ),
                                                          ),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Icon(
                                                                item['icon']
                                                                    as IconData,
                                                                color:
                                                                    Color.fromRGBO(
                                                                      153,
                                                                      93,
                                                                      254,
                                                                      1,
                                                                    ),
                                                              ),
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                              Text(
                                                                item['label']
                                                                    as String,
                                                                style: TextStyle(
                                                                  fontSize: 16,
                                                                  color:
                                                                      Color.fromRGBO(
                                                                        153,
                                                                        93,
                                                                        254,
                                                                        1,
                                                                      ),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text(
                                                        'ยกเลิก',
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(height: 40),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        style: TextButton.styleFrom(
                                          backgroundColor: Color.fromRGBO(
                                            26,
                                            24,
                                            24,
                                            0.08,
                                          ),
                                          padding: EdgeInsets.symmetric(
                                            vertical: 15,
                                            horizontal: 14,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              16,
                                            ),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              'อัพโหลดรูป',
                                              style: TextStyle(
                                                color: Color.fromRGBO(
                                                  26,
                                                  24,
                                                  24,
                                                  0.35,
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 8),
                                            SvgPicture.asset(
                                              'assets/images/image-add.svg',
                                              width: 24,
                                              height: 24,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
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
                  int page = agentController.inviteForm.value;
                  bool isEnabled = false;
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
                    isEnabled = _insuranceTypeController.text.trim().isNotEmpty;
                  }
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      agentController.inviteForm.value > 0
                          ? IconButton(
                            onPressed: () {
                              final prevPage =
                                  agentController.inviteForm.value - 1;
                              if (prevPage >= 0) {
                                _pageController.animateToPage(
                                  prevPage,
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                                agentController.setInviteForm(prevPage);
                                setState(() {});
                              }
                            },
                            icon: Icon(Icons.keyboard_arrow_left_outlined),
                          )
                          : SizedBox.shrink(),
                      Obx(() {
                        if (agentController.selectedActivity.value ==
                            'เลือกกิจกรรม') {
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
                                    if (agentController.inviteForm.value < 2) {
                                      final nextPage =
                                          agentController.inviteForm.value + 1;
                                      _pageController.animateToPage(
                                        nextPage,
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.easeInOut,
                                      );
                                      agentController.setInviteForm(nextPage);
                                      setState(() {});
                                    } else {
                                      Get.to(
                                        RegisterAgentInviteFriendSuccess(),
                                      );
                                    }
                                  }
                                  : null,
                          child: Text(
                            agentController.inviteForm.value == 2
                                ? 'ยืนยัน'
                                : 'ถัดไป',
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
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
