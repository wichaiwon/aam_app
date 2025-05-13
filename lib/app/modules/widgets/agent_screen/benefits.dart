import 'package:flutter/material.dart';

class Benefits extends StatelessWidget {
  final String desc1;
  final String desc2;
  final String desc3;

  const Benefits({
    super.key,
    required this.desc1,
    required this.desc2,
    required this.desc3,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Color.fromRGBO(121, 42, 255, 0.08)),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: List.generate(3, (index) {
              final steps = [desc1, desc2, desc3];
              return Padding(
                padding:
                    index == 2
                        ? EdgeInsets.zero
                        : const EdgeInsets.only(bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${index + 1}.',
                      style: TextStyle(
                        color: Color.fromRGBO(121, 42, 255, 0.75),
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        steps[index],
                        style: TextStyle(
                          color: Color.fromRGBO(121, 42, 255, 1),
                          fontSize: 14,
                        ),
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
