import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nano_health/core/theme/color.dart';

import '../../../core/util/fade_in_index_stack.dart';
import '../../../shared/decorated_box_widget.dart';
import '../../product/screen/product_screen.dart';

class BottomNavbarScreen extends StatefulWidget {
  const BottomNavbarScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavbarScreen> createState() => _BottomNavbarScreenState();
}

class _BottomNavbarScreenState extends State<BottomNavbarScreen> {
  int currentPageIndex = 0;
  List<Widget> pages = [
    const ProductScreen(),
    const Center(
      child: Text('Cart'),
    ),
    const Center(
      child: Text('Favourite'),
    ),
    const Center(
      child: Text('Profile'),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: DecoratedBoxWidget(
        radius: 22,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(22.0),
            topRight: Radius.circular(22.0),
          ),
          child: NavigationBar(
            backgroundColor: Colors.white,
            indicatorColor: Colors.transparent,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            onDestinationSelected: (int index) {
              setState(() {
                currentPageIndex = index;
              });
            },
            selectedIndex: currentPageIndex,
            destinations: <Widget>[
              NavigationDestination(
                icon: SvgPicture.asset(
                  'assets/svg/navbar/home.svg',
                  colorFilter:
                      ColorFilter.mode(Colors.grey.shade400, BlendMode.srcIn),
                ),
                selectedIcon: SvgPicture.asset(
                  'assets/svg/navbar/home.svg',
                ),
                label: 'Home',
              ),
              customNavigationDestination("Cart", "cart"),
              customNavigationDestination("Like", "like"),
              customNavigationDestination("User", "user"),
            ],
          ),
        ),
      ),
      body: FadeIndexedStack(
        index: currentPageIndex,
        children: pages,
      ),
    );
  }

  NavigationDestination customNavigationDestination(
      String label, String iconName) {
    return NavigationDestination(
      icon: SvgPicture.asset(
        'assets/svg/navbar/$iconName.svg',
      ),
      selectedIcon: SvgPicture.asset(
        'assets/svg/navbar/$iconName.svg',
        colorFilter:
            const ColorFilter.mode(Color(kPrimaryColor), BlendMode.srcIn),
      ),
      label: label,
    );
  }
}
