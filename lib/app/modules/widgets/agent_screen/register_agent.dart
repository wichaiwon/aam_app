import 'package:aam_app/app/modules/widgets/register_agent_screen/register_agent_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterAgent extends StatelessWidget {
  final String comeToBeAgent;
  final String comeToBeAgentDesc;
  final String registerButton;

  const RegisterAgent({
    super.key,
    required this.comeToBeAgent,
    required this.comeToBeAgentDesc,
    required this.registerButton,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(24),
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              color: Color.fromRGBO(121, 42, 255, 0.08),
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
          ),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80),
                ),
                child: Image.asset(
                  'assets/images/group.png',
                  width: 126.44,
                  height: 67,
                ),
              ),
              SizedBox(height: 10),
              Text(
                comeToBeAgent,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 10),
              Text(
                textAlign: TextAlign.center,
                comeToBeAgentDesc,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(26, 24, 24, 0.5),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Get.to(
                    () => RegisterAgentForm(),
                    transition: Transition.rightToLeft,
                    duration: Duration(milliseconds: 500),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 14),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(121, 42, 255, 0.08),
                    border: Border.all(color: Colors.transparent, width: 1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    registerButton,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromRGBO(121, 42, 255, 0.75),
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
