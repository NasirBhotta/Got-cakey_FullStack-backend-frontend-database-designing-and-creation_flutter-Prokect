import 'package:flutter/material.dart';
import 'package:got_cakey_mobile/utills/constants/mobile_constants.dart';

class GCOnboardSC3 extends StatefulWidget {
  final TextEditingController bioController;
  final GlobalKey<FormState> formKey;
  final Function callback;
  const GCOnboardSC3(
      {super.key,
      required this.bioController,
      required this.formKey,
      required this.callback});

  @override
  State<GCOnboardSC3> createState() => _GCOnboardSC3State();
}

class _GCOnboardSC3State extends State<GCOnboardSC3> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Form(
        key: widget.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: (size.height * 0.03),
            ),
            Text("Tell us about you",
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
                    text: "Your bio",
                    style: TextStyle(
                        color: GCConstants.primaryColor,
                        fontFamily: 'Nordo',
                        fontWeight: FontWeight.w500,
                        fontSize: GCConstants(size: size).fontsize())),
                TextSpan(
                    text: "  (optional)",
                    style: TextStyle(
                        color: GCConstants.tertiaryTextColor,
                        fontFamily: 'Nordo',
                        fontWeight: FontWeight.w500,
                        fontSize: GCConstants(size: size).fontsize())),
              ]),
            ),
            SizedBox(
              height: (size.height * 0.015),
            ),
            SizedBox(
              height: 150,
              child: TextFormField(
                style: TextStyle(
                    fontFamily: 'Nordo',
                    fontSize: GCConstants(size: size).fontsize()),
                controller: widget.bioController,
                textAlign: TextAlign.start,
                textAlignVertical: TextAlignVertical.top,
                cursorColor: GCConstants.borderColor,
                expands: true,
                minLines: null,
                maxLines: null,
                onChanged: (value) {
                  widget.callback(value);
                },
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  contentPadding: const EdgeInsets.only(top: 10, left: 10),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: GCConstants.borderColor)),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: GCConstants.secondaryColor)),
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: GCConstants.errorColor)),
                  labelText: "Enter bio",
                  labelStyle: TextStyle(
                      color: GCConstants.tertiaryTextColor,
                      fontSize: GCConstants(size: size).textFieldFont()),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                ),
              ),
            ),
            const Expanded(child: SizedBox.shrink()),
          ],
        ),
      ),
    );
  }
}
