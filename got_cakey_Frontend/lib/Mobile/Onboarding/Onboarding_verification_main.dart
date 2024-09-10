// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:got_cakey_mobile/Mobile/Onboarding/Baker_Onboarding/Onboard_VerificationSC1.dart';
import 'package:got_cakey_mobile/Mobile/Onboarding/Baker_Onboarding/Onboard_VerificationSC2.dart';
import 'package:got_cakey_mobile/Mobile/Onboarding/Baker_Onboarding/Onboard_VerificationSC3.dart';
import 'package:got_cakey_mobile/Mobile/Onboarding/Baker_Onboarding/Onboard_VerificationSC4.dart';
import 'package:got_cakey_mobile/Mobile/Onboarding/Baker_Onboarding/Onboard_VerificationSC5.dart';
import 'package:got_cakey_mobile/utills/constants/mobile_constants.dart';
import 'package:got_cakey_mobile/Mobile/main_screens/onboarding_verified_baker.dart';
import 'package:got_cakey_mobile/utills/services/user_info_services.dart';
import 'package:got_cakey_mobile/utills/tem_data_holder.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class OnBoardVerifyMain extends StatefulWidget {
  const OnBoardVerifyMain({super.key});

  @override
  State<OnBoardVerifyMain> createState() => _OnBoardVerifyMainState();
}

class _OnBoardVerifyMainState extends State<OnBoardVerifyMain> {
  final TextEditingController _businessNameCont = TextEditingController();
  final TextEditingController _usernameCon = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _pickupController = TextEditingController();
  final TextEditingController _st_controller = TextEditingController();
  final TextEditingController _sb_controller = TextEditingController();
  final TextEditingController _post_controller = TextEditingController();
  final TextEditingController _sugg_controller = TextEditingController();
  final GlobalKey<FormState> _formKeySC1 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeySC2 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeySC3 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeySC4 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeySC5 = GlobalKey<FormState>();
  final UserInfoServices userInfoServices = UserInfoServices();
  final PageController _pageController =
      PageController(initialPage: 0, viewportFraction: 1);
  int currentPage = 0;
  bool button_mode = false;
  bool bake_type = false;
  bool address_mode = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: GCConstants.whiteColor,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(110),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    color: const Color.fromRGBO(80, 12, 127, 1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        currentPage != 0
                            ? IconButton(
                                onPressed: () {
                                  _pageController.previousPage(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.linear);
                                },
                                icon: Image.asset('assets/back.png'))
                            : const SizedBox.shrink(),
                        const Expanded(child: SizedBox.shrink()),
                        LinearPercentIndicator(
                          width: size.width * 0.5,
                          backgroundColor: const Color.fromRGBO(64, 9, 102, 1),
                          barRadius: const Radius.circular(10),
                          progressColor: GCConstants.successColor,
                          percent: ((currentPage / 10) + 0.1) * 2,
                        ),
                        const Expanded(child: SizedBox.shrink()),
                        currentPage != 0
                            ? SizedBox(
                                width: size.width * 0.135,
                              )
                            : const SizedBox.shrink()
                      ],
                    ),
                  ),
                ),
                Image.asset(
                  'assets/border.png',
                  fit: BoxFit.contain,
                )
              ],
            )),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageController,
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                // physics: NeverScrollableScrollPhysics(),
                children: [
                  GCOnboardSC1(
                    businessNameCont: _businessNameCont,
                    formKey: _formKeySC1,
                  ),
                  GCOnboardSC2(
                    usernameCon: _usernameCon,
                    formKey: _formKeySC2,
                  ),
                  GCOnboardSC3(
                    bioController: _bioController,
                    formKey: _formKeySC3,
                    callback: (value) {
                      if (value != '') {
                        setState(() {
                          button_mode = true;
                        });
                      } else {
                        setState(() {
                          button_mode = false;
                        });
                      }
                    },
                  ),
                  GCOnboardSC4(
                    pickup_controller: _pickupController,
                    formKey: _formKeySC4,
                    post_controller: _post_controller,
                    st_controller: _st_controller,
                    sb_controller: _sb_controller,
                    callback: (addressmode) {
                      address_mode = addressmode;
                    },
                  ),
                  GCOnboardSC5(
                    suggController: _sugg_controller,
                    formKey: _formKeySC5,
                    callback: (List<bool> list) {
                      bake_type = list.any((item) => item == true);
                    },
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: _createElevatedButton(
                  "Next", const Color.fromRGBO(146, 4, 190, 1), size, context),
            ),
            SizedBox(
              height: (size.height * 0.015),
            ),
          ],
        ),
      ),
    );
  }

  Widget _createElevatedButton(
      String value, Color color, Size size, BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        if (currentPage == 0) {
          if (!_formKeySC1.currentState!.validate()) {
            return;
          }
          TemporaryData.buisness_name = _businessNameCont.text;
          _formKeySC1.currentState!.save();
          _pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.linear);
        } else if (currentPage == 1) {
          if (!_formKeySC2.currentState!.validate() ||
              TemporaryData.img == '') {
            return;
          }
          TemporaryData.username = _usernameCon.text;
          _formKeySC2.currentState!.save();
          _pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.linear);
        } else if (currentPage == 2) {
          TemporaryData.bio = _bioController.text;
          _pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.linear);
        } else if (currentPage == 3) {
          if (!_formKeySC4.currentState!.validate()) {
            return;
          }
          if (address_mode == false) {
            TemporaryData.pickup_address = _pickupController.text;
            TemporaryData.street_address = '';
            TemporaryData.suburb = '';
            TemporaryData.postcode = '';
          } else {
            TemporaryData.street_address = _st_controller.text;
            TemporaryData.suburb = _sb_controller.text;
            TemporaryData.postcode = _post_controller.text;
            TemporaryData.pickup_address = '';
          }
          _formKeySC4.currentState!.save();
          _pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.linear);
        } else if (currentPage == 4) {
          if (bake_type == false) {
            return;
          }
          var data = await userInfoServices.setInfo(context);

          if (data['user_info'] == '' || data.isEmpty) {
            return;
          }

          TemporaryData.suggestion = _sugg_controller.text;
          _formKeySC5.currentState!.save();

          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const GCVerifiedBaker(),
          ));
        }
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: currentPage == 2
              ? _bioController.text != ''
                  ? color
                  : GCConstants.quatenaryColor
              : color,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          padding: EdgeInsets.only(
              left: size.height <= 450
                  ? 21.dg
                  : size.height <= 645
                      ? 30.dg
                      : 18,
              right: size.height <= 450
                  ? 21.dg
                  : size.height <= 645
                      ? 30.dg
                      : 18,
              top: GCConstants(size: size).gcButtonPaddingTop(),
              bottom: GCConstants(size: size).gcButtonPaddingBottom())),
      child: Text(
        currentPage == 2
            ? button_mode == true
                ? value
                : 'Skip for now'
            : value,
        style: TextStyle(
          color: currentPage == 2
              ? _bioController.text != ''
                  ? const Color.fromARGB(255, 255, 255, 255)
                  : GCConstants.secondaryColor
              : const Color.fromARGB(255, 255, 255, 255),
          fontWeight: FontWeight.normal,
          fontSize: GCConstants(size: size).fontsize(),
        ),
      ),
    );
  }
}
