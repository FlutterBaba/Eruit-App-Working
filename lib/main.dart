import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yaqoob_test_project/Pages/splash/splash_page.dart';
import 'package:yaqoob_test_project/provider/order_provider/create_order_provider.dart';
import 'package:yaqoob_test_project/provider/order_summery_provider/order_summery_provider.dart';
import 'Pages/auth/login/login_page.dart';
import 'const.dart';
import 'provider/order_provider/order_provider.dart';
import 'shared_service.dart';

Widget _defaultHome = const LoginPage();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Set default home.
  // Get result of the login function.
  bool result = await SharedService.isLoggedIn();
  if (result) {
    _defaultHome = const SplishScreen();
    // OrderListPage();
    //  HomePage();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OrderProvider()),
        ChangeNotifierProvider(create: (_) => CreateOrderProvider()),
        ChangeNotifierProvider(create: (_) => OrderSummeryProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Eruit App',
        theme: ThemeData(
          iconTheme: const IconThemeData(color: ktextColor),
          cupertinoOverrideTheme: const NoDefaultCupertinoThemeData(
            primaryColor: ktextColor,
            textTheme: CupertinoTextThemeData(
              primaryColor: ktextColor,
            ),
          ),
          scaffoldBackgroundColor: Colors.white,
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: ktextColor,
                fontSizeDelta: 1.2,
                fontFamily: "Poppins",
              ),
          fontFamily: "Poppins",
          primaryColor: kpColor,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 0,
              backgroundColor: kpColor,
              fixedSize: const Size.fromHeight(48),
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            suffixIconColor: klightTextColor,
            alignLabelWithHint: true,
            labelStyle: const TextStyle(color: klightTextColor),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: kborderColor),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: kborderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: ktextColor),
            ),
          ),
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black),
            backgroundColor: Colors.white,
            titleTextStyle: TextStyle(
              color: ktextColor,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        home: _defaultHome,
      ),
    );
  }
}
