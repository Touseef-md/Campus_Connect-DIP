import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './main_screen.dart';
import '../providers/auth_provider.dart';
import '../providers/order_provider.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});
  static const routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  String email = "";

  void _submit() async {
    // print('Submit si called ');
    // if (!_formKey.currentState!.validate()) {
    //   print('Current state is null');
    // }
    if (_formKey.currentState == null && !_formKey.currentState!.validate()) {
      return;
    }
    print('BEfore save');
    _formKey.currentState!.save();
    print('Save is done ');
    try {
      print('INside try');
      final auth = Provider.of<Auth>(
        context,
        listen: false,
      );
      await auth.register(email);
      // print('THis is the auth response ${authResponse}');
      print('THis is the token ${auth.getToken}');
      await Provider.of<Orders>(
        context,
        listen: false,
      ).fetchAndSet(
        userId: auth.getToken,
      );
      Navigator.pushNamed(context, MainScreen.routeName);
    } catch (error) {
      print('This is the auth error${error}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(
              0xffef6c00,
            ),
            Color(0xffffc107)
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          // height: height * 0.5,
          // color: Colors.grey,
          alignment: Alignment.center,
          child: Column(
            children: [
              Container(
                alignment: Alignment.bottomLeft,
                height: height * 0.814,
                // color: Colors.green,
                margin: EdgeInsets.fromLTRB(
                  0,
                  150,
                  0,
                  0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      // textAlign: TextAlign.start,
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Welcome Back',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Container(
                      // alignment: Alignment.bottomCenter,
                      margin: EdgeInsets.fromLTRB(
                        0,
                        50,
                        0,
                        0,
                      ),
                      width: double.infinity,
                      height: 520,
                      // color: Colors.white,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          // color: Colors.transparent,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(
                              40,
                            ),
                            topLeft: Radius.circular(
                              40,
                            ),
                          )
                          // shape: RoundedRectangleBorder(side: ),
                          ),
                      child: Card(
                        margin: EdgeInsets.symmetric(
                          vertical: 30,
                          horizontal: 20,
                        ),
                        color: Colors.grey,
                        shadowColor: Colors.amber,
                        elevation: 5,
                        child: Column(children: [
                          Form(
                            key: _formKey,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  TextFormField(
                                    decoration: InputDecoration(
                                      labelText: 'E-mail',
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                    onSaved: (newValue) {
                                      email =
                                          (newValue == null) ? '' : newValue;
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.amber[900],
                            ),
                            onPressed: _submit,
                            child: Text(
                              'Register',
                            ),
                          )
                        ]),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
