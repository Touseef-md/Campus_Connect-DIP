import 'package:flutter/material.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});
  static const routeName = '/feedback';
  final dropDownItems = const [
    'Hygeine',
    'Delivery agent',
    'Food Quality',
    'App issues',
    'Waiting Time',
    'Payment',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Feedback',
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: Column(
          children: [
            Text(
              'Send Feedback',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              'Tell us what you love about the app, or what we could be doing better.',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Type',
                ),
                SizedBox(
                  width: 10,
                ),
                DropdownButton(
                  items: [
                    DropdownMenuItem(
                        child: Text(
                      'Hygine',
                    ))
                  ],
                  onChanged: (value) {},
                )
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: ElevatedButton(
        style: ButtonStyle(
          // maximumSize: MaterialStateProperty.all<Size>(),
          minimumSize: MaterialStateProperty.all<Size>(
            Size(
              10,
              50,
            ),
          ),
          maximumSize: MaterialStateProperty.all<Size>(
            Size(
              10,
              50,
            ),
          ),
        ),
        onPressed: () {},
        child: Text(
          'Submit Feedback',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
