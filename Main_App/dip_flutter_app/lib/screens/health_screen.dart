import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HealthScreen extends StatelessWidget {
  const HealthScreen({super.key});
  static const routeName = '/health';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Health Tracker',
        ),
      ),
      body: Center(
        child: Text(
          'THis is the health screen ',
        ),
      ),
    );
  }
}
