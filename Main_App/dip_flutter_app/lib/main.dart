import 'package:flutter/material.dart';
import './screens/main_screen.dart';
import './screens/profile_screen.dart';
import './screens/feedback_screen.dart';
import './screens/faq_screen.dart';
import './screens/health_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.from(
        colorScheme: ColorScheme.light().copyWith(
          primary: Color.fromARGB(255, 10, 85, 190),
          secondary: Color.fromARGB(255, 0, 184, 221),
        ),
        textTheme: TextTheme(
          headline4: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
      // home: MainScreen(),
      routes: {
        '/': (ctx) => MainScreen(),
        ProfileScreen.routeName: (ctx) => ProfileScreen(),
        FeedbackScreen.routeName: (ctx) => FeedbackScreen(),
        HealthScreen.routeName: (ctx) => HealthScreen(),
        FAQScreen.routeName: (ctx) => FAQScreen(),
      },
    );
  }
}
