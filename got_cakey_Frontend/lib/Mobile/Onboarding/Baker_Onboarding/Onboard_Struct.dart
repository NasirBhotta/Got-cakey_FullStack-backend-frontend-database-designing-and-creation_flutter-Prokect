import 'package:flutter/material.dart';

import 'package:got_cakey_mobile/Mobile/Onboarding/Baker_Onboarding/CustomOnboardWidget.dart';
import 'package:got_cakey_mobile/Mobile/Onboarding/Onboarding_verification_main.dart';
import 'package:got_cakey_mobile/utills/constants/mobile_constants.dart';
// import 'package:got_cakey_mobile/provider/authProvider.dart';
// import 'package:provider/provider.dart';

class OnboardStruct extends StatefulWidget {
  const OnboardStruct({super.key});

  @override
  State<OnboardStruct> createState() => _OnboardStructState();
}

class _OnboardStructState extends State<OnboardStruct> {
  final _pageController =
      PageController(initialPage: 0, keepPage: true, viewportFraction: 1);
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: [
        PageView(
          controller: _pageController,
          scrollDirection: Axis.horizontal,
          onPageChanged: (value) {
            setState(() {
              currentPage = value;
            });
          },
          children: [
            CustomOnboarding(
                img: "assets/pic1.png",
                primaryText: "Bake on your own schedule",
                secondaryText:
                    "Whether you're an early bird who loves to bake at dawn or a night owl who thrives in the moonlight, you can create and bake when it suits you best.",
                color: const Color.fromRGBO(225, 141, 241, 1),
                pageController: _pageController),
            CustomOnboarding(
                img: "assets/pic2.png",
                primaryText: "Easily manage \norders",
                secondaryText:
                    "Managing orders has never been easier. With Got Cakey, you can focus on what you do best, \nbaking!",
                color: const Color.fromRGBO(249, 182, 172, 1),
                pageController: _pageController),
            CustomOnboarding(
                img: "assets/pic3.png",
                primaryText: "Set your prices and menu options",
                secondaryText:
                    "Regardless of your unique flair, take control of your business by setting your prices and cake options.",
                color: const Color.fromRGBO(255, 234, 66, 1),
                pageController: _pageController),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _createElevatedButton(
                  "Next",
                  const Color.fromRGBO(244, 231, 248, 1),
                  size,
                  context,
                  _pageController,
                  false),
              SizedBox(
                height: size.height * 0.1,
              ),
            ],
          ),
        )
      ]),
    );
  }

  Widget _createElevatedButton(String value, Color color, Size size,
      BuildContext context, PageController pageController, bool animate) {
    return ElevatedButton(
      onPressed: () {
        if (currentPage < 2) {
          pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn);
        }
        if (currentPage == 2) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const OnBoardVerifyMain(),
              ));
        }
      },
      style: ElevatedButton.styleFrom(
          backgroundColor:
              currentPage == 2 ? const Color.fromRGBO(152, 10, 196, 1) : color,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          padding: EdgeInsetsDirectional.only(
              top: GCConstants(size: size).gcButtonPaddingTop(),
              bottom: GCConstants(size: size).gcButtonPaddingTop())),
      child: Text(
        currentPage == 2 ? "Get Started" : value,
        style: TextStyle(
          color:
              currentPage == 2 ? color : const Color.fromRGBO(152, 10, 196, 1),
          fontWeight: FontWeight.w600,
          fontSize: GCConstants(size: size).fontsize(),
        ),
      ),
    );
  }
}
