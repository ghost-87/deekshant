import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:deekshant_app/home/account/account_screen.dart';
import 'package:deekshant_app/home/cart/cart_screen.dart';
import 'package:deekshant_app/home/explore/explore_screen.dart';
import 'package:deekshant_app/home/favourite/favourite_screen.dart';
import 'package:deekshant_app/home/shop/shop_screen.dart';
import 'package:deekshant_app/values/assets.dart';
import 'package:deekshant_app/values/base_colors.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          ShopScreen(),
          ExploreScreen(),
          CartScreen(),
          FavouriteScreen(),
          AccountScreen(),
        ],
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        child: BottomNavigationBar(
          selectedItemColor: BaseColors.accentColor,
          unselectedItemColor: BaseColors.gray1,
          showUnselectedLabels: true,
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (page) {
            setState(() {
              currentIndex = page;
              _pageController.animateToPage(
                page,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeOut,
              );
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home), // SvgPicture.asset(SVGs.icShop),
              label: 'Home',
              activeIcon: Icon(
                Icons.home,
                size: 40,
                color: Colors.blue,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search_rounded),
              label: 'Explore',
              activeIcon: Icon(
                Icons.search_rounded,
                size: 40,
                color: Colors.blue,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              label: 'Cart',
              activeIcon: Icon(
                Icons.shopping_cart_outlined,
                size: 40,
                color: Colors.blue,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outlined),
              label: 'Favourite',
              activeIcon: Icon(
                Icons.favorite_outlined,
                size: 40,
                color: Colors.blue,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_rounded),
              label: 'Account',
              activeIcon: Icon(
                Icons.account_circle_rounded,
                size: 40,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
