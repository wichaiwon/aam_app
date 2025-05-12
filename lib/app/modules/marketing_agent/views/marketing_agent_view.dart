import 'package:flutter/material.dart';

class MarketingAgentView extends StatelessWidget {
  const MarketingAgentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Marketing Agent')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[Text('Marketing Agent View')],
        ),
      ),
    );
  }
}
