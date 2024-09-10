// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:got_cakey_mobile/utills/TextFields/text_fileds.dart';
import 'package:got_cakey_mobile/utills/constants/mobile_constants.dart';
import 'package:got_cakey_mobile/utills/tem_data_holder.dart';

class GCOnboardSC4 extends StatefulWidget {
  final TextEditingController pickup_controller;
  final TextEditingController st_controller;
  final TextEditingController sb_controller;
  final TextEditingController post_controller;
  final Function callback;
  final GlobalKey<FormState> formKey;
  const GCOnboardSC4({
    super.key,
    required this.pickup_controller,
    required this.formKey,
    required this.st_controller,
    required this.sb_controller,
    required this.post_controller,
    required this.callback,
  });

  @override
  State<GCOnboardSC4> createState() => _GCOnboardSC4State();
}

class _GCOnboardSC4State extends State<GCOnboardSC4> {
  bool address_mode = false;
  String? _selectedValue = "Select a state";
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        height: size.height * 0.73,
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Form(
          key: widget.formKey,
          child: address_mode == false
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: (size.height * 0.03),
                    ),
                    Text("Enter your address",
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
                            text: "Pickup address",
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
                        title: "pickupaddress",
                        labeltext: "",
                        onSaved: (p0) {},
                        necessary: true,
                        controller: widget.pickup_controller,
                        type: "pickupaddress"),
                    SizedBox(
                      height: (size.height * 0.015),
                    ),
                    Row(
                      children: [
                        Text("Can't see your address?",
                            style: TextStyle(
                                color: GCConstants.tertiaryTextColor,
                                fontFamily: 'Nordo',
                                fontWeight: FontWeight.w500,
                                fontSize: GCConstants(size: size).fontsize())),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                address_mode = true;
                              });
                              widget.callback(address_mode);
                            },
                            child: Text("   Enter it manually",
                                style: TextStyle(
                                    color: GCConstants.secondaryColor,
                                    fontFamily: 'Nordo',
                                    fontWeight: FontWeight.w500,
                                    fontSize:
                                        GCConstants(size: size).fontsize())))
                      ],
                    )
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: (size.height * 0.03),
                    ),
                    Text("Enter your address",
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
                            text: "Street address",
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
                        title: "streetaddress",
                        labeltext: "",
                        onSaved: (p0) {
                          TemporaryData.street_address = p0!;
                        },
                        necessary: true,
                        controller: widget.st_controller,
                        type: "manualaddress"),
                    SizedBox(
                      height: (size.height * 0.03),
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Suburb",
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
                        title: "suburb",
                        labeltext: "",
                        onSaved: (p0) {
                          TemporaryData.suburb = p0!;
                        },
                        necessary: true,
                        controller: widget.sb_controller,
                        type: "manualaddress"),
                    SizedBox(
                      height: (size.height * 0.03),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "Postcode",
                                    style: TextStyle(
                                        color: GCConstants.primaryColor,
                                        fontFamily: 'Nordo',
                                        fontWeight: FontWeight.bold,
                                        fontSize: GCConstants(size: size)
                                            .fontsize())),
                                const TextSpan(text: "*"),
                              ]),
                            ),
                            SizedBox(
                              height: (size.height * 0.017),
                            ),
                            SizedBox(
                              height: size.height * 0.11,
                              width: size.width * 0.44,
                              child: CustomTextField(
                                  title: "postcode",
                                  labeltext: "",
                                  onSaved: (p0) {
                                    TemporaryData.postcode = p0!;
                                  },
                                  necessary: true,
                                  controller: widget.post_controller,
                                  type: "manualaddress"),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: size.width * 0.02,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "State",
                                    style: TextStyle(
                                        color: GCConstants.primaryColor,
                                        fontFamily: 'Nordo',
                                        fontWeight: FontWeight.bold,
                                        fontSize: GCConstants(size: size)
                                            .fontsize())),
                                const TextSpan(text: "*"),
                              ]),
                            ),
                            SizedBox(
                              height: (size.height * 0.015),
                            ),
                            SizedBox(
                              height: _selectedValue == "Select a state"
                                  ? size.height * 0.11
                                  : size.height * 0.11,
                              width: size.width * 0.42,
                              child: DropdownButtonFormField<String>(
                                validator: (value) {
                                  if (value == "Select a state") {
                                    return "Select a state";
                                  }

                                  return null;
                                },
                                decoration: InputDecoration(
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color.fromRGBO(208, 54, 96, 1),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    errorBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color.fromRGBO(208, 54, 96, 1),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: GCConstants.borderColor,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: GCConstants.secondaryColor,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    contentPadding: EdgeInsets.only(
                                        top: GCConstants(size: size)
                                            .gcButtonPaddingTop(),
                                        bottom: GCConstants(size: size)
                                            .gcButtonPaddingBottom(),
                                        left: 10,
                                        right: 10)),
                                style: const TextStyle(
                                    fontFamily: 'Nordo',
                                    fontWeight: FontWeight.normal),
                                value: _selectedValue!,
                                icon: const Expanded(
                                    child: Align(
                                        alignment: Alignment.centerRight,
                                        child:
                                            Icon(Icons.keyboard_arrow_down))),
                                items: [
                                  DropdownMenuItem<String>(
                                    value: "Select a state",
                                    child: Text(
                                      "Select a state",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Nordo',
                                          fontWeight: FontWeight.w400,
                                          fontSize: GCConstants(size: size)
                                              .fontsize()),
                                    ),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: "Australia",
                                    child: Text(
                                      "Australia",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Nordo',
                                          fontWeight: FontWeight.w400,
                                          fontSize: GCConstants(size: size)
                                              .fontsize()),
                                    ),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: "England",
                                    child: Text("England",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Nordo',
                                            fontWeight: FontWeight.w400,
                                            fontSize: GCConstants(size: size)
                                                .fontsize())),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: "Pakistan",
                                    child: Text("Pakistan",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Nordo',
                                            fontWeight: FontWeight.w400,
                                            fontSize: GCConstants(size: size)
                                                .fontsize())),
                                  )
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    _selectedValue = value;
                                  });

                                  TemporaryData.state = _selectedValue!;
                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    // SizedBox(
                    //   height: (size.height * 0.02),
                    // ),
                    Row(
                      children: [
                        Text("Want to go back?",
                            style: TextStyle(
                                color: GCConstants.tertiaryTextColor,
                                fontFamily: 'Nordo',
                                fontWeight: FontWeight.w500,
                                fontSize: GCConstants(size: size).fontsize())),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                address_mode = false;
                              });
                              widget.callback(address_mode);
                            },
                            child: Text("   Search for it",
                                style: TextStyle(
                                    color: GCConstants.secondaryColor,
                                    fontFamily: 'Nordo',
                                    fontWeight: FontWeight.w500,
                                    fontSize:
                                        GCConstants(size: size).fontsize())))
                      ],
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
