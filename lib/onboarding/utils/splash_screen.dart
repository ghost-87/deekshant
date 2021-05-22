import 'package:flutter/material.dart';
import 'package:deekshant_app/onboarding/widgets/login_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Colors.deepOrange),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Center(
              child: Image(
                  height: MediaQuery.of(context).size.height * 0.3,
                  fit: BoxFit.fill,
                  image: const AssetImage('assets/img/login_logo.png')),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromRadius(50),
                shape: const BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
              ),
              child: const Icon(Icons.arrow_forward_ios_rounded, size: 40),
              onPressed: () => Navigator.pushAndRemoveUntil<MaterialPageRoute>(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => const LoginPage()),
                (Route<dynamic> route) => false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
