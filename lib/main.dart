import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:deekshant_app/home/home_screen.dart';
import 'package:deekshant_app/onboarding/utils/splash_screen.dart';
import 'package:deekshant_app/values/base_colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeekShant',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: BaseColors.white,
        primaryColor: BaseColors.accentColor,
        accentColor: BaseColors.accentColor,
        fontFamily: GoogleFonts.poppins().fontFamily,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: <String, WidgetBuilder>{
        '/home': (_) => HomeScreen(),
      },
      home: SplashScreen(),
    );
  }
}
