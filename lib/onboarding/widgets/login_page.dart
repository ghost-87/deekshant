import 'package:flutter/material.dart';
import 'package:deekshant_app/onboarding/widgets/sign_in.dart';
import 'package:deekshant_app/onboarding/widgets/sign_up.dart';
import 'package:deekshant_app/onboarding/theme.dart';
import 'package:deekshant_app/onboarding/utils/bubble_indicator_painter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  PageController _pageController;

  bool isSignupClicked = false;
  bool isStoreClicked = false;
  Color left = Colors.black;
  Color right = Colors.white;
  Color faded = Colors.black12;
  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: _buildBoxDecoration(isStoreClicked),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: _bannerWidget(isStoreClicked),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: _buildUserType(context),
                ),
                Expanded(
                  flex: 2,
                  child: PageView(
                    controller: _pageController,
                    physics: const ClampingScrollPhysics(),
                    onPageChanged: (int i) {
                      FocusScope.of(context).requestFocus(FocusNode());
                      if (i == 0) {
                        setState(() {
                          right = Colors.white;
                          left = Colors.black;
                        });
                      } else if (i == 1) {
                        setState(() {
                          right = Colors.black;
                          left = Colors.white;
                        });
                      }
                    },
                    children: <Widget>[
                      ConstrainedBox(
                        constraints: const BoxConstraints.expand(),
                        child: const SignIn(),
                      ),
                      ConstrainedBox(
                        constraints: const BoxConstraints.expand(),
                        child: const SignUp(),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: _buildMenuBar(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration(bool isStoreClicked) {
    return isStoreClicked
        ? const BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                CustomTheme.loginGradientStart,
                CustomTheme.loginGradientEnd
              ],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(1.0, 1.0),
              stops: <double>[0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
          )
        : const BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                CustomTheme.loginGradientEnd,
                CustomTheme.loginGradientStart
              ],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(1.0, 1.0),
              stops: <double>[0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
          );
  }

  Widget _bannerWidget(bool isStoreClicked) {
    return isStoreClicked
        ? const Icon(Icons.store, size: 40)
        : const Icon(Icons.shopping_cart_outlined, size: 40);
  }

  Widget _buildUserType(BuildContext context) {
    return Container(
      // child: CustomPaint(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: TextButton(
              onPressed: _onCustomerUser,
              child: Text(
                'Customer',
                style: TextStyle(
                  decoration: isStoreClicked
                      ? TextDecoration.none
                      : TextDecoration.underline,
                  color: isStoreClicked ? right : left,
                  fontSize: isStoreClicked ? 15.0 : 20.0,
                  fontFamily: 'WorkSansSemiBold',
                ),
              ),
            ),
          ),
          Expanded(
              child: TextButton(
            onPressed: _onStoreUser,
            child: Text(
              'Store',
              style: TextStyle(
                  decoration: isStoreClicked
                      ? TextDecoration.underline
                      : TextDecoration.none,
                  color: isStoreClicked ? left : right,
                  fontSize: isStoreClicked ? 20.0 : 15.0,
                  fontFamily: 'WorkSansSemiBold'),
            ),
          )),
        ],
      ),
      // ),
    );
  }

  Widget _buildMenuBar(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 50.0,
      decoration: const BoxDecoration(
        color: Color(0x552B2B2B),
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
      child: CustomPaint(
        painter: BubbleIndicatorPainter(pageController: _pageController),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                ),
                onPressed: _onSignInButtonPress,
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: left,
                    fontSize: 16.0,
                    fontFamily: 'WorkSansSemiBold',
                  ),
                ),
              ),
            ),
            Expanded(
              child: TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                ),
                onPressed: _onSignUpButtonPress,
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                      color: right,
                      fontSize: 16.0,
                      fontFamily: 'WorkSansSemiBold'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onCustomerUser() {
    print('customer selected');
    setState(() {
      isStoreClicked = false;
    });
    // _pageController.animateToPage(0,
    //     duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void _onStoreUser() {
    print('store selected');
    setState(() {
      isStoreClicked = true;
    });
    // _pageController?.animateToPage(1,
    //     duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void _onSignInButtonPress() {
    setState(() {
      isSignupClicked = false;
    });
    _pageController.animateToPage(0,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void _onSignUpButtonPress() {
    setState(() {
      isSignupClicked = true;
    });
    _pageController?.animateToPage(1,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }
}
