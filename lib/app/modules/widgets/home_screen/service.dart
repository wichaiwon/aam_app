import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Service extends StatelessWidget {
  final String title;
  final String registerLoan;
  final String registerInstallment;
  final String branch;

  const Service({
    super.key,
    required this.title,
    required this.registerLoan,
    required this.registerInstallment,
    required this.branch,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> items = [
      {'icon': 'assets/images/file.svg', 'text': registerLoan},
      {'icon': 'assets/images/baht.svg', 'text': registerInstallment},
      {'icon': 'assets/images/location.svg', 'text': branch},
    ];

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: Color.fromRGBO(121, 42, 255, 1),
                  width: 3,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 10),
                Text(
                  title,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(items.length, (index) {
              final item = items[index];
              return Padding(
                padding: EdgeInsets.only(
                  right: index < items.length - 1 ? 16 : 0,
                ),
                child: Column(
                  children: [
                    Container(
                      width: 60,
                      height: 46,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(121, 42, 255, 0.05),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: SvgPicture.asset(
                        item['icon']!,
                        width: 24,
                        height: 24,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      item['text']!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
