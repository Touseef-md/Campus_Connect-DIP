import 'package:dip_flutter_app/modals/carousel_data.dart';
import 'package:flutter/material.dart';

class FeedbackScreen extends StatefulWidget {
  FeedbackScreen({super.key});
  static const routeName = '/feedback';

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final dropDownItems = const [
    'Hygeine',
    'Delivery agent',
    'Food Quality',
    'App issues',
    'Waiting Time',
    'Payment',
    'Others',
    'Select'
  ];
  final _form = GlobalKey<FormState>();
  String? dropDownValue = 'Select';

  void _submitForm() {
    bool isEmpty = (_form.currentState == null) ? false : true;
    if (!isEmpty) return;
    bool isValid = _form.currentState!.validate();
    if (!isValid) return;

    _form.currentState!.save();
    print('Current state of the form is ${_form.currentState}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(
          'Feedback',
        ),
      ),
      body: Container(
        // color: Colors.white,
        margin: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      value: dropDownValue,
                      items: [
                        ...dropDownItems.map(
                          (item) {
                            return DropdownMenuItem(
                              child: Text(
                                item,
                              ),
                              value: item,
                            );
                          },
                        ).toList()
                      ],
                      hint: const Text(
                        'Select',
                      ),
                      onChanged: (newValue) {
                        setState(() {
                          dropDownValue = newValue;
                          print('NEw drop value $newValue');
                        });
                      },
                    ),
                  ],
                ),
                Form(
                  key: _form,
                  child: TextFormField(
                    onFieldSubmitted: (value) {
                      // print('Field submitted $value');
                      // _submitForm();
                    },
                    onSaved: (newValue) {
                      // print('ON saved called $newValue');
                    },
                    decoration: InputDecoration(
                      label: Text('Enter feedback'),
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  _submitForm();
                },
                child: Text(
                  'Submit Feedback',
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                  minimumSize: Size(
                    double.infinity,
                    50,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
