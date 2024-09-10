// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:got_cakey_mobile/utills/TextFields/text_fileds.dart';
import 'package:got_cakey_mobile/utills/constants/mobile_constants.dart';
import 'package:got_cakey_mobile/utills/tem_data_holder.dart';

class GCOnboardSC2 extends StatefulWidget {
  final TextEditingController usernameCon;
  final GlobalKey<FormState> formKey;
  const GCOnboardSC2({
    super.key,
    required this.usernameCon,
    required this.formKey,
  });

  @override
  State<GCOnboardSC2> createState() => _GCOnboardSC2State();
}

class _GCOnboardSC2State extends State<GCOnboardSC2> {
  bool image_uploaded = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Form(
        key: widget.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: (size.height * 0.03),
            ),
            Text("Set up your profile",
                style: TextStyle(
                    color: GCConstants.primaryColor,
                    fontFamily: 'Ginto',
                    fontWeight: FontWeight.bold,
                    fontSize: GCConstants(size: size).secFontSize())),
            SizedBox(
              height: (size.height * 0.02),
            ),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: "Upload a profile picture *",
                    style: TextStyle(
                        color: GCConstants.primaryColor,
                        fontFamily: 'Nordo',
                        fontWeight: FontWeight.bold,
                        fontSize: GCConstants(size: size).fontsize())),
                const TextSpan(text: "*"),
              ]),
            ),
            SizedBox(
              height: (size.height * 0.015),
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: GCConstants.tertiaryTextColor, width: 1),
                      borderRadius: BorderRadius.circular(30)),
                  child: CircleAvatar(
                    foregroundImage: null,
                    backgroundColor: Colors.transparent,
                    child: Image.asset(
                      'assets/account-img.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                _createElevatedButton(
                    "Upload photo", GCConstants.secondaryColor, size, context),
              ],
            ),
            SizedBox(
              height: (size.height * 0.015),
            ),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: "Baker Username",
                    style: TextStyle(
                        color: GCConstants.primaryColor,
                        fontFamily: 'Nordo',
                        fontWeight: FontWeight.bold,
                        fontSize: GCConstants(size: size).fontsize())),
                const TextSpan(text: "*"),
              ]),
            ),
            SizedBox(
              height: (size.height * 0.015),
            ),
            CustomTextField(
                title: "username",
                labeltext: "",
                onSaved: (p0) {},
                necessary: true,
                controller: widget.usernameCon,
                type: "username"),
          ],
        ),
      ),
    );
  }

  Widget _createElevatedButton(
      String value, Color color, Size size, BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        TemporaryData.img = "myimage.jpg";
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          padding: EdgeInsets.only(
              left: size.height <= 450
                  ? 21.dg
                  : size.height <= 645
                      ? 30.dg
                      : 21,
              right: size.height <= 450
                  ? 21.dg
                  : size.height <= 645
                      ? 30.dg
                      : 21,
              top: GCConstants(size: size).gcButtonPaddingTop(),
              bottom: GCConstants(size: size).gcButtonPaddingBottom())),
      child: Text(
        value,
        style: TextStyle(
          color: const Color.fromARGB(255, 255, 255, 255),
          fontWeight: FontWeight.normal,
          fontSize: GCConstants(size: size).fontsize(),
        ),
      ),
    );
  }
}
