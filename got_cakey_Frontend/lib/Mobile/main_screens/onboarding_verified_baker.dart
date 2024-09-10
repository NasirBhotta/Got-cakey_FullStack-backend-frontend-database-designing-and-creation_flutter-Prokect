import 'package:flutter/material.dart';
import 'package:got_cakey_mobile/Mobile/main_screens/orders/orders_onboarding.dart';

class GCVerifiedBaker extends StatefulWidget {
  const GCVerifiedBaker({super.key});

  @override
  State<GCVerifiedBaker> createState() => _GCVerifiedBakerState();
}

List<Widget> bottomNavBar = [const OrdersOnboarding()];

class _GCVerifiedBakerState extends State<GCVerifiedBaker> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: bottomNavBar[_index],
        bottomNavigationBar: SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
          child: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Image.asset('assets/order-inactive.png'),
                label: 'Orders',
                activeIcon: Image.asset('assets/order-active.png'),
              ),
              BottomNavigationBarItem(
                  icon: Image.asset('assets/gallery.png'),
                  label: 'Gallery',
                  activeIcon: Image.asset('assets/gallery-active.png')),
              BottomNavigationBarItem(
                  icon: Image.asset('assets/insights-inactive.png'),
                  label: 'Insights',
                  activeIcon: Image.asset('assets/insights-active.png')),
              BottomNavigationBarItem(
                  icon: Image.asset('assets/mail-inactive.png'),
                  label: 'Inbox',
                  activeIcon: Image.asset('assets/mail-active.png')),
              BottomNavigationBarItem(
                  icon: Image.asset('assets/profile-inactive.png'),
                  label: 'Profile',
                  activeIcon: Image.asset('assets/profile-active.png'))
            ],
            backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
            currentIndex: _index,
            onTap: (value) {
              setState(() {
                _index = value;
              });
            },
            showUnselectedLabels: true,
            selectedFontSize: 13,
            unselectedFontSize: 12,
            type: BottomNavigationBarType.fixed,
          ),
        ),
      ),
    );
  }
}
