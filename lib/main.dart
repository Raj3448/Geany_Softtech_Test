import 'package:demoapp/core/util/colors.dart';
import 'package:demoapp/feature/Auth/auth_page1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: backGroundColor,
          appBarTheme: const AppBarTheme()
              .copyWith(color: Colors.white, surfaceTintColor: Colors.white),
          useMaterial3: true,
        ),
        home: AuthPage1(),
      );
    });
  }
}