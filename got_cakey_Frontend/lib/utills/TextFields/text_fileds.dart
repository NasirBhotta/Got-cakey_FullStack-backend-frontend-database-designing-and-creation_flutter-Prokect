import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:got_cakey_mobile/utills/constants/mobile_constants.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final String labeltext;
  final bool necessary;
  final String type;
  final Function(String?) onSaved;
  const CustomTextField({
    super.key,
    required this.title,
    required this.labeltext,
    required this.onSaved,
    required this.necessary,
    required this.controller,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      child: TextFormField(
        controller: controller,
        cursorColor: type == "verification" ||
                type == 'manualaddress' ||
                type == "username" ||
                type == "pickupaddress"
            ? const Color.fromRGBO(0, 0, 0, 1)
            : Colors.white,
        style: TextStyle(
            color: type == "verification" ||
                    type == 'manualaddress' ||
                    type == "username" ||
                    type == "pickupaddress"
                ? GCConstants.tertiaryTextColor
                : Colors.white,
            fontFamily: 'Ginto Nordo',
            fontWeight: FontWeight.normal,
            fontSize: GCConstants(size: size).textFieldFont()),
        decoration: InputDecoration(
          prefixIcon: title == 'username'
              ? Icon(
                  Icons.alternate_email,
                  color: GCConstants.tertiaryTextColor,
                  size: 17,
                )
              : type == "pickupaddress"
                  ? Image.asset("assets/location_pin.png")
                  : null,
          contentPadding: type == "verification" ||
                  type == 'manualaddress' ||
                  type == 'username' ||
                  type == "pickupaddress"
              ? EdgeInsets.only(
                  top: size.height <= 450
                      ? 17.dg
                      : size.height <= 645
                          ? 13.dg
                          : 10,
                  bottom: size.height <= 450
                      ? 17.dg
                      : size.height <= 645
                          ? 13.dg
                          : 10,
                  left: 10,
                  right: 10)
              : EdgeInsets.only(
                  top: size.height <= 450
                      ? 17.dg
                      : size.height <= 645
                          ? 13.dg
                          : 10,
                  bottom: size.height <= 450
                      ? 17.dg
                      : size.height <= 645
                          ? 13.dg
                          : 10,
                  left: 10,
                  right: 10),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color.fromRGBO(208, 54, 96, 1),
              ),
              borderRadius: BorderRadius.circular(10)),
          errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color.fromRGBO(208, 54, 96, 1),
              ),
              borderRadius: BorderRadius.circular(10)),
          labelText: labeltext,
          labelStyle: TextStyle(
            color: GCConstants.tertiaryTextColor,
            fontSize: necessary == true
                ? GCConstants(size: size).textFieldFont()
                : 12,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: type == "verification" ||
                        type == 'manualaddress' ||
                        type == "username" ||
                        type == "pickupaddress"
                    ? GCConstants.borderColor
                    : Colors.white),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: type == "verification" ||
                        type == 'manualaddress' ||
                        type == "username" ||
                        type == "pickupaddress"
                    ? GCConstants.secondaryColor
                    : Colors.white),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        validator: (value) {
          if (value!.isEmpty && labeltext == "Email") {
            return "Email is Required";
          } else if (value.isEmpty && labeltext == "Password") {
            return "Password is Required";
          } else if (value.isEmpty && labeltext == "Postcode") {
            return "PostCode is Required";
          } else if (value.isEmpty && labeltext == "Enter business name") {
            return "Business name is required";
          } else if (value.isEmpty && title == 'username') {
            return 'Username is required';
          } else if (value.isEmpty && title == "pickupaddress") {
            return 'Pickup address is required';
          } else if (value.isEmpty && title == "streetaddress") {
            return 'Street address is required';
          } else if (value.isEmpty && title == "suburb") {
            return 'suburb is required';
          } else if (value.isEmpty && title == "postcode") {
            return 'postcode is required';
          }
          return null;
        },
        onSaved: (newValue) {
          onSaved(newValue);
        },
      ),
    );
  }
}
