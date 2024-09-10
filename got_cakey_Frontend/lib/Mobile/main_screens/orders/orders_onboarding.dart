import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:got_cakey_mobile/utills/constants/mobile_constants.dart';
import 'package:got_cakey_mobile/Mobile/main_screens/profile/user_profile_setup.dart';
import 'package:got_cakey_mobile/provider/userInfo.dart';
import 'package:provider/provider.dart';

class OrdersOnboarding extends StatefulWidget {
  const OrdersOnboarding({super.key});

  @override
  State<OrdersOnboarding> createState() => _OrdersOnboardingState();
}

class _OrdersOnboardingState extends State<OrdersOnboarding> {
  bool clicked = false;
  String capitalizeFirstLetter(String input) {
    if (input.isEmpty) {
      return input;
    }
    return input[0].toUpperCase() + input.substring(1).toLowerCase();
  }

  // ignore: non_constant_identifier_names
  void show_amend_profile_modal() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) => Container(
              padding:
                  const EdgeInsets.only(left: 20, right: 20, top: 8, bottom: 8),
              height: MediaQuery.of(context).size.height * 0.9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(Icons.clear)),
                      const Expanded(child: SizedBox.shrink()),
                      Text(
                        "Edit profile picture",
                        style: TextStyle(
                            fontFamily: 'PP-Mori-Regular',
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: GCConstants.primaryColor),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 3.4,
                      )
                    ],
                  ),
                  Container(
                    color: GCConstants.borderColor,
                    height: 2,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Text(
                              "Profile picture",
                              style: TextStyle(
                                  fontFamily: 'PP-Mori-Regular',
                                  fontSize: GCConstants(
                                          size: MediaQuery.of(context).size)
                                      .fontsize(),
                                  fontWeight: FontWeight.w600,
                                  color: GCConstants.primaryColor),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Stack(
                                    children: [
                                      Container(
                                        height: 80,
                                        width: 80,
                                        decoration: BoxDecoration(
                                            color: GCConstants.borderColor,
                                            borderRadius:
                                                BorderRadius.circular(60)),
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(60),
                                            child: Image.asset(
                                              "assets/profile.jpg",
                                              fit: BoxFit.cover,
                                            )),
                                      ),
                                      Positioned(
                                        right: 0,
                                        bottom: 0,
                                        child: Container(
                                          height: 20,
                                          width: 20,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: GCConstants.primaryColor),
                                          child: GestureDetector(
                                            onTap: () {},
                                            child: Icon(
                                              Icons.mode_edit_outlined,
                                              color: GCConstants.whiteColor,
                                              size: 12,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.03,
                                ),
                                Text(
                                  "Recommended dimension:\n320 x 320 pixels",
                                  style: TextStyle(
                                      fontFamily: 'PP-Mori-Regular',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: GCConstants.primaryColor),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            const Divider(),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Text(
                              "Masthead picture",
                              style: TextStyle(
                                  fontFamily: 'PP-Mori-Regular',
                                  fontSize: GCConstants(
                                          size: MediaQuery.of(context).size)
                                      .fontsize(),
                                  fontWeight: FontWeight.w600,
                                  color: GCConstants.primaryColor),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.008,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.2,
                              decoration: BoxDecoration(
                                  color: GCConstants.borderColor,
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.008,
                            ),
                            Text(
                              "Recommended dimension:\n1280 x 250 pixels",
                              style: TextStyle(
                                  fontFamily: 'PP-Mori-Regular',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: GCConstants.primaryColor),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Container(
                              color: GCConstants.borderColor,
                              height: 2,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Text(
                              "Bio",
                              style: TextStyle(
                                  fontFamily: 'PP-Mori-Regular',
                                  fontSize: GCConstants(
                                          size: MediaQuery.of(context).size)
                                      .fontsize(),
                                  fontWeight: FontWeight.w600,
                                  color: GCConstants.primaryColor),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.2,
                              child: TextFormField(
                                style: TextStyle(
                                    fontFamily: 'Nordo',
                                    fontSize: GCConstants(
                                            size: MediaQuery.of(context).size)
                                        .fontsize()),
                                // controller: widget.bioController,
                                textAlign: TextAlign.start,
                                textAlignVertical: TextAlignVertical.top,
                                cursorColor: GCConstants.borderColor,
                                expands: true,
                                minLines: null,
                                maxLines: null,
                                onChanged: (value) {
                                  // widget.callback(value);
                                },
                                decoration: InputDecoration(
                                  alignLabelWithHint: true,
                                  contentPadding:
                                      const EdgeInsets.only(top: 10, left: 10),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: GCConstants.borderColor)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: GCConstants.secondaryColor)),
                                  errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: GCConstants.errorColor)),
                                  labelText: "Enter bio",
                                  labelStyle: TextStyle(
                                      color: GCConstants.tertiaryTextColor,
                                      fontSize: GCConstants(
                                              size: MediaQuery.of(context).size)
                                          .textFieldFont()),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Container(
                              color: GCConstants.borderColor,
                              height: 2,
                            ),
                          ]),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.015,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          child: Text(
                            "Revert",
                            style: TextStyle(
                                fontFamily: 'PP-Mori-Regular',
                                fontSize: GCConstants(
                                        size: MediaQuery.of(context).size)
                                    .fontsize(),
                                fontWeight: FontWeight.w600,
                                color: GCConstants.primaryColor),
                          ),
                        ),
                      ),
                      Expanded(
                        child: _createElevatedButton(
                            'Save Changes',
                            GCConstants.secondaryColor,
                            MediaQuery.of(context).size,
                            context),
                      )
                    ],
                  ),
                ],
              ),
            ));
  }

  Widget _createElevatedButton(
      String value, Color color, Size size, BuildContext context) {
    return ElevatedButton(
      onPressed: () async {},
      style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          padding: EdgeInsetsDirectional.only(
              top: GCConstants(size: size).gcButtonPaddingTop(),
              bottom: GCConstants(size: size).gcButtonPaddingBottom())),
      child: clicked == false
          ? Text(
              value,
              style: TextStyle(
                color: GCConstants.whiteColor,
                fontWeight: FontWeight.w500,
                fontSize: GCConstants(size: size).fontsize(),
              ),
            )
          : SizedBox(
              height: size.height <= 450
                  ? 21.dg
                  : size.height <= 645
                      ? 17.dg
                      : 21,
              width: size.height <= 450
                  ? 21.dg
                  : size.height <= 645
                      ? 17.dg
                      : 21,
              child: const CircularProgressIndicator.adaptive(
                valueColor:
                    AlwaysStoppedAnimation<Color>(Color.fromRGBO(57, 9, 92, 1)),
                strokeWidth: 1,
              ),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserinfoProvider>(context).userInfo;

    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: GCConstants.primaryColor,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: size.height * 0.1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          "Hey, ${capitalizeFirstLetter(user.username)}",
                          style: TextStyle(
                              fontFamily: 'Ginto',
                              fontWeight: FontWeight.w400,
                              color: GCConstants.whiteColor,
                              fontSize: GCConstants(size: size).secFontSize()),
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: GCConstants.whiteColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Stack(
                            children: [Image.asset("assets/Bell.png")],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Text(
                    "Before you can go live",
                    style: TextStyle(
                        color: GCConstants.whiteColor,
                        fontFamily: 'PP-Mori-Regular'),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Card(
                    color: GCConstants.whiteColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: SizedBox(
                      height: size.height * 0.13,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset('assets/shield_check.png'),
                            SizedBox(
                              height: size.height * 0.008,
                            ),
                            Text(
                              "Proof of business registration",
                              style: TextStyle(
                                  fontFamily: 'PP-Mori-Regular',
                                  fontWeight: FontWeight.w600,
                                  color: GCConstants.primaryColor),
                            ),
                            SizedBox(
                              height: size.height * 0.015,
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 8, right: 8),
                              decoration: BoxDecoration(
                                  color: user.verification_doc == ''
                                      ? GCConstants.WarningColor
                                      : GCConstants.successColor,
                                  borderRadius: BorderRadius.circular(5)),
                              child: user.verification_doc == ''
                                  ? Text("Awaiting verification",
                                      style: TextStyle(
                                          fontFamily: 'PP-Mori-Regular',
                                          fontSize: GCConstants(size: size)
                                              .fontsize(),
                                          fontWeight: FontWeight.w400))
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(
                                          Icons.done,
                                          color: GCConstants.primaryColor,
                                        ),
                                        const Text("Complete",
                                            style: TextStyle(
                                                fontFamily: 'PP-Mori-Regular',
                                                fontWeight: FontWeight.w400))
                                      ],
                                    ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const UserProfileSetup(),
                      ));
                    },
                    child: Card(
                      color: GCConstants.whiteColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      child: SizedBox(
                        height: size.height * 0.13,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset('assets/Identification.png'),
                              SizedBox(
                                height: size.height * 0.008,
                              ),
                              Text(
                                "Set username and profile picture",
                                style: TextStyle(
                                    fontFamily: 'PP-Mori-Regular',
                                    fontWeight: FontWeight.w600,
                                    color: GCConstants.primaryColor),
                              ),
                              SizedBox(
                                height: size.height * 0.015,
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.only(left: 8, right: 8),
                                decoration: BoxDecoration(
                                    color: user.img == '' && user.username == ''
                                        ? GCConstants.WarningColor
                                        : GCConstants.successColor,
                                    borderRadius: BorderRadius.circular(5)),
                                child: user.img == '' && user.username == ''
                                    ? Text("Awaiting verification",
                                        style: TextStyle(
                                            fontFamily: 'PP-Mori-Regular',
                                            fontSize: GCConstants(size: size)
                                                .fontsize(),
                                            fontWeight: FontWeight.w400))
                                    : ConstrainedBox(
                                        constraints: BoxConstraints(
                                            maxWidth: size.width - 335),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(
                                              Icons.done,
                                              size: GCConstants(size: size)
                                                  .fontsize(),
                                              color: GCConstants.primaryColor,
                                            ),
                                            Text("Complete",
                                                style: TextStyle(
                                                    fontFamily:
                                                        'PP-Mori-Regular',
                                                    fontSize:
                                                        GCConstants(size: size)
                                                            .fontsize(),
                                                    fontWeight:
                                                        FontWeight.w400))
                                          ],
                                        ),
                                      ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const UserProfileSetup(),
                      ));
                    },
                    child: Card(
                      color: GCConstants.whiteColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      child: SizedBox(
                        height: size.height * 0.13,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset('assets/location_marker.png'),
                              SizedBox(
                                height: size.height * 0.008,
                              ),
                              Text(
                                "Set pick up address",
                                style: TextStyle(
                                    fontFamily: 'PP-Mori-Regular',
                                    fontWeight: FontWeight.w600,
                                    color: GCConstants.primaryColor),
                              ),
                              SizedBox(
                                height: size.height * 0.015,
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.only(left: 8, right: 8),
                                decoration: BoxDecoration(
                                    color: user.pickup_address == ''
                                        ? GCConstants.WarningColor
                                        : GCConstants.successColor,
                                    borderRadius: BorderRadius.circular(5)),
                                child: user.img == '' && user.username == ''
                                    ? Text("Awaiting verification",
                                        style: TextStyle(
                                            fontFamily: 'PP-Mori-Regular',
                                            fontSize: GCConstants(size: size)
                                                .fontsize(),
                                            fontWeight: FontWeight.w400))
                                    : ConstrainedBox(
                                        constraints: BoxConstraints(
                                            maxWidth: size.width - 335),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(
                                              Icons.done,
                                              size: GCConstants(size: size)
                                                  .fontsize(),
                                              color: GCConstants.primaryColor,
                                            ),
                                            Text("Complete",
                                                style: TextStyle(
                                                    fontFamily:
                                                        'PP-Mori-Regular',
                                                    fontSize:
                                                        GCConstants(size: size)
                                                            .fontsize(),
                                                    fontWeight:
                                                        FontWeight.w400))
                                          ],
                                        ),
                                      ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const UserProfileSetup(),
                      ));
                    },
                    child: Card(
                      color: GCConstants.whiteColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      child: SizedBox(
                        height: size.height * 0.13,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset('assets/phone.png'),
                              SizedBox(
                                height: size.height * 0.008,
                              ),
                              Text(
                                "Verify mobile number",
                                style: TextStyle(
                                    fontFamily: 'PP-Mori-Regular',
                                    fontWeight: FontWeight.w600,
                                    color: GCConstants.primaryColor),
                              ),
                              SizedBox(
                                height: size.height * 0.015,
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.only(left: 8, right: 8),
                                decoration: BoxDecoration(
                                    color: user.contact_no == '' ||
                                            user.contact_no == null
                                        ? GCConstants.errorLightColor
                                        : GCConstants.successColor,
                                    borderRadius: BorderRadius.circular(5)),
                                child: user.contact_no == '' ||
                                        user.contact_no == null
                                    ? Text("required",
                                        style: TextStyle(
                                            fontFamily: 'PP-Mori-Regular',
                                            color: user.contact_no == '' ||
                                                    user.contact_no == null
                                                ? GCConstants.errorColor
                                                : GCConstants.primaryColor,
                                            fontSize: GCConstants(size: size)
                                                .fontsize(),
                                            fontWeight: FontWeight.w400))
                                    : ConstrainedBox(
                                        constraints: BoxConstraints(
                                            maxWidth: size.width - 335),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(
                                              Icons.done,
                                              size: GCConstants(size: size)
                                                  .fontsize(),
                                              color: GCConstants.primaryColor,
                                            ),
                                            Text("Complete",
                                                style: TextStyle(
                                                    fontFamily:
                                                        'PP-Mori-Regular',
                                                    fontSize:
                                                        GCConstants(size: size)
                                                            .fontsize(),
                                                    fontWeight:
                                                        FontWeight.w400))
                                          ],
                                        ),
                                      ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  )
                ],
              ),
            ),
          ),
          Image.asset('assets/border.png'),
          SizedBox(
            height: size.height * 0.01,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Waiting for verification?",
                  style: TextStyle(
                      fontFamily: 'PP-Mori-Regular',
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: GCConstants.primaryColor),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                GestureDetector(
                  onTap: () {
                    show_amend_profile_modal();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: GCConstants.whiteColor,
                        border: Border.all(
                          color: GCConstants.borderColor,
                        ),
                        borderRadius: BorderRadius.circular(5)),
                    height: size.height * 0.1,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset('assets/user.png'),
                              SizedBox(
                                width: size.width * 0.01,
                              ),
                              Text(
                                "Amend profile",
                                style: TextStyle(
                                    fontFamily: 'PP-Mori-Regular',
                                    fontWeight: FontWeight.w600,
                                    color: GCConstants.primaryColor),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Text(
                            "Amend your a profile picture, profile banner and bio",
                            style: TextStyle(
                                color: GCConstants.primaryColor,
                                fontFamily: 'PP-Mori-Regular',
                                fontSize: GCConstants(size: size).fontsize(),
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: GCConstants.whiteColor,
                      border: Border.all(
                        color: GCConstants.borderColor,
                      ),
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: IntrinsicHeight(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset('assets/cake_outlined.png'),
                              SizedBox(
                                width: size.width * 0.01,
                              ),
                              Text(
                                "Post to gallery",
                                style: TextStyle(
                                    fontFamily: 'PP-Mori-Regular',
                                    fontWeight: FontWeight.w600,
                                    color: GCConstants.primaryColor),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Text(
                            "Start populating your profile with cakes you've already baked",
                            style: TextStyle(
                                color: GCConstants.primaryColor,
                                fontFamily: 'PP-Mori-Regular',
                                fontSize: GCConstants(size: size).fontsize(),
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: GCConstants.whiteColor,
                      border: Border.all(
                        color: GCConstants.borderColor,
                      ),
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/pencil_alt.png'),
                            SizedBox(
                              width: size.width * 0.01,
                            ),
                            Text(
                              "Add presets to menu",
                              style: TextStyle(
                                  fontFamily: 'PP-Mori-Regular',
                                  fontWeight: FontWeight.w600,
                                  color: GCConstants.primaryColor),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Text(
                          "Make responding to quote requests easier by setting up your baked goods",
                          style: TextStyle(
                              color: GCConstants.primaryColor,
                              fontFamily: 'PP-Mori-Regular',
                              fontSize: GCConstants(size: size).fontsize(),
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: GCConstants.whiteColor,
                      border: Border.all(
                        color: GCConstants.borderColor,
                      ),
                      borderRadius: BorderRadius.circular(5)),
                  height: size.height * 0.1,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/currency_dollar.png'),
                            SizedBox(
                              width: size.width * 0.01,
                            ),
                            Text(
                              "Add payout information",
                              style: TextStyle(
                                  fontFamily: 'PP-Mori-Regular',
                                  fontWeight: FontWeight.w600,
                                  color: GCConstants.primaryColor),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Text(
                          "Get paid on your terms",
                          style: TextStyle(
                              color: GCConstants.primaryColor,
                              fontFamily: 'PP-Mori-Regular',
                              fontSize: GCConstants(size: size).fontsize(),
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: GCConstants.whiteColor,
                      border: Border.all(
                        color: GCConstants.borderColor,
                      ),
                      borderRadius: BorderRadius.circular(5)),
                  height: size.height * 0.1,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/briefcase.png'),
                            SizedBox(
                              width: size.width * 0.01,
                            ),
                            Text(
                              "Add business details",
                              style: TextStyle(
                                  fontFamily: 'PP-Mori-Regular',
                                  fontWeight: FontWeight.w600,
                                  color: GCConstants.primaryColor),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Text(
                          "Make tax time easier by linking your ABN",
                          style: TextStyle(
                              color: GCConstants.primaryColor,
                              fontFamily: 'PP-Mori-Regular',
                              fontSize: GCConstants(size: size).fontsize(),
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: size.height * 0.03,
                ),
                Text(
                  "Need help getting started?",
                  style: TextStyle(
                      fontFamily: 'PP-Mori-Regular',
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: GCConstants.primaryColor),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("View Help & Support",
                        style: TextStyle(
                            fontFamily: 'PP-Mori-Regular',
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: GCConstants.primaryColor)),
                    const SizedBox(
                      width: 5,
                    ),
                    const Icon(Icons.arrow_forward),
                    const Expanded(child: SizedBox.shrink())
                  ],
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: GCConstants.quatenaryColor,
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "How do i set my availability?",
                          style: TextStyle(
                              color: GCConstants.primaryColor,
                              fontFamily: 'PP-Mori-Regular',
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        Container(
                            decoration: BoxDecoration(
                                color: GCConstants.whiteColor,
                                borderRadius: BorderRadius.circular(20)),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.arrow_forward),
                            ))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: GCConstants.quatenaryColor,
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "How do i set up my profile?",
                            style: TextStyle(
                                color: GCConstants.primaryColor,
                                fontFamily: 'PP-Mori-Regular',
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          Container(
                              decoration: BoxDecoration(
                                  color: GCConstants.whiteColor,
                                  borderRadius: BorderRadius.circular(20)),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(Icons.arrow_forward),
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: GCConstants.quatenaryColor,
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "How do i edit my account\ndetails and profile?",
                          style: TextStyle(
                              color: GCConstants.primaryColor,
                              fontFamily: 'PP-Mori-Regular',
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        Container(
                            decoration: BoxDecoration(
                                color: GCConstants.whiteColor,
                                borderRadius: BorderRadius.circular(20)),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.arrow_forward),
                            ))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: GCConstants.quatenaryColor,
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Why do I need to verify\nmy mobile number?",
                          style: TextStyle(
                              color: GCConstants.primaryColor,
                              fontFamily: 'PP-Mori-Regular',
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        Container(
                            decoration: BoxDecoration(
                                color: GCConstants.whiteColor,
                                borderRadius: BorderRadius.circular(20)),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.arrow_forward),
                            ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.05,
          )
        ],
      ),
    );
  }
}
