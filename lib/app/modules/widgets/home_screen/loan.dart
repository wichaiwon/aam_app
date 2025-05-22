import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Loan extends StatelessWidget {
  final String title;
  final String yourLoan;
  final double loanAmount;
  final String loanStatus;
  final String condition;
  final String loanButton;

  const Loan({
    super.key,
    required this.title,
    required this.yourLoan,
    required this.loanAmount,
    required this.loanStatus,
    required this.condition,
    required this.loanButton,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color.fromRGBO(249, 249, 249, 1),
        border: Border.all(
          color: const Color.fromRGBO(121, 42, 255, 0.08),
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  Text(
                    condition,
                    style: TextStyle(
                      fontSize: 12,
                      color: Color.fromRGBO(26, 24, 24, 0.5),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 4),
                  Icon(
                    Icons.chevron_right,
                    size: 14,
                    color: Color.fromRGBO(26, 24, 24, 0.5),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    yourLoan,
                    style: TextStyle(
                      color: Color.fromRGBO(26, 24, 24, 0.5),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    NumberFormat.currency(
                      locale: 'th',
                      symbol: '฿',
                      decimalDigits: 0,
                    ).format(loanAmount),
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(121, 42, 255, 0.75),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        size: 18,
                        color: Color.fromRGBO(121, 42, 255, 0.75),
                      ),
                      SizedBox(width: 4),
                      Text(
                        loanStatus,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(121, 42, 255, 0.75),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(109, 36),
                  backgroundColor: const Color.fromRGBO(121, 42, 255, 0.75),
                  elevation: 10,
                  shadowColor: const Color.fromRGBO(
                    121,
                    42,
                    255,
                    0.45,
                  ), // 👈 สีเงา
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // 👈 มุมโค้ง
                  ),
                ),
                child: Text(
                  loanButton,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
