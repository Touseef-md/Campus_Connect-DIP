import 'package:flutter/material.dart';

class DividerText extends StatelessWidget {
  final String label;
  const DividerText({
    super.key,
    required this.label,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            indent: 10,
            endIndent: 10,
            // thickness: 3,
            color: Colors.black,
          ),
        ),
        Text(
          label,
        ),
        Expanded(
          child: Divider(
            color: Colors.black,
            indent: 10,
            endIndent: 10,
          ),
        )
      ],
    );
  }
}
