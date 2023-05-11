import 'package:dip_flutter_app/providers/vendor_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import './screens/main_screen.dart';
import './screens/profile_screen.dart';
import './screens/feedback_screen.dart';
import './screens/faq_screen.dart';
import './screens/health_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/cart_screen.dart';
import './screens/orders_screen.dart';
import './providers/cart_provider.dart';
import './providers/order_provider.dart';
import './providers/auth_provider.dart';
import './screens/vender_screen.dart';
import './screens/login_screen.dart';

Future main() async {
  await dotenv.load(fileName: 'lib/.env');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Auth(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProxyProvider<Auth, Orders>(
          update: (context, auth, previousOrdersValue) {
            if (auth.getToken == '') {
              return Orders([]);
            }
            return Orders((previousOrdersValue == null)
                ? []
                : previousOrdersValue.getOrders as List<OrderItem>);
          },
          create: (context) => Orders([]),
        ),
        ChangeNotifierProvider(
          create: (context) => VendorOrders(),
        ),
      ],
      child: MaterialApp(
        title: 'DIP App',
        theme: ThemeData.from(
          // useMaterial3: true,
          colorScheme: ColorScheme.light().copyWith(
            // primary: Colors.grey[600],
            primary: Color.fromARGB(255, 10, 85, 190),
            secondary: Color.fromARGB(255, 0, 184, 221),
          ),
          textTheme: const TextTheme(
            headline4: TextStyle(
              color: Colors.black,
              fontSize: 25,
            ),
            headline2: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 45,
            ),
            headline5: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            headline6: TextStyle(
              color: Colors.white,
            ),
            caption: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            bodyText1: TextStyle(
              color: Colors.black,
              fontSize: 25,
            ),
            button: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        ),
        // home: MainScreen(),
        routes: {
          '/': (context) => LoginScreen(),
          MainScreen.routeName: (ctx) => MainScreen(),
          ProfileScreen.routeName: (ctx) => const ProfileScreen(),
          FeedbackScreen.routeName: (ctx) => FeedbackScreen(),
          HealthScreen.routeName: (ctx) => HealthScreen(),
          FAQScreen.routeName: (ctx) => FAQScreen(),
          MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          OrdersScreen.routeName: (ctx) => OrdersScreen(),
          VendorScreen.routeName: (ctx) => VendorScreen(),
          LoginScreen.routeName: (ctx) => LoginScreen(),
        },
      ),
    );
  }
}
