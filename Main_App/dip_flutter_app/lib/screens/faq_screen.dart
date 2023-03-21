import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});
  static const routeName = '/faq';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'FAQs',
        ),
      ),
      body: Center(
        child: Text(
          'This is the FAQ screen',
        ),
      ),
    );
  }
}
