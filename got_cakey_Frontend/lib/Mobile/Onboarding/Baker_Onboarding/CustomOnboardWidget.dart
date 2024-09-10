import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomOnboarding extends StatelessWidget {
  final String img;
  final String primaryText;
  final String secondaryText;
  final Color color;
  final PageController pageController;
  const CustomOnboarding(
      {super.key,
      required this.img,
      required this.primaryText,
      required this.secondaryText,
      required this.color,
      required this.pageController});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      color: color,
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.2,
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: Image.asset(
                img,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: size.height * 0.001,
                  ),
                  Text(
                    primaryText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color.fromRGBO(
                        64,
                        9,
                        102,
                        1,
                      ),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Ginto',
                      fontSize: size.width <= 390
                          ? 38.dg
                          : size.width <= 515
                              ? 32.dg
                              : 30,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.020,
                  ),
                  Text(
                    secondaryText,
                    style: TextStyle(
                        fontSize: size.width <= 390
                            ? 20.dg
                            : size.width <= 515
                                ? 14.dg
                                : 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Nord'),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.11,
          ),
          SizedBox(
            height: size.height * 0.1,
          ),
        ],
      ),
    );
  }
}
