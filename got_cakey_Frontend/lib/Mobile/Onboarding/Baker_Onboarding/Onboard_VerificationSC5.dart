import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:got_cakey_mobile/utills/constants/mobile_constants.dart';
import 'package:got_cakey_mobile/utills/tem_data_holder.dart';

class GCOnboardSC5 extends StatefulWidget {
  final TextEditingController suggController;
  final GlobalKey<FormState> formKey;
  final Function callback;
  const GCOnboardSC5({
    super.key,
    required this.suggController,
    required this.formKey,
    required this.callback,
  });

  @override
  State<GCOnboardSC5> createState() => _GCOnboardSC5State();
}

class _GCOnboardSC5State extends State<GCOnboardSC5> {
  List<bool> selected = [false, false, false];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Form(
          key: widget.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: (size.height * 0.03),
              ),
              Text("What do you bake?",
                  style: TextStyle(
                      color: GCConstants.primaryColor,
                      fontFamily: 'Ginto',
                      fontWeight: FontWeight.bold,
                      fontSize: GCConstants(size: size).secFontSize())),
              SizedBox(
                height: (size.height * 0.02),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          if (selected[0] == false) {
                            selected[0] = true;
                            TemporaryData.baked_type.add("cakes");
                          } else {
                            selected[0] = false;
                            if (TemporaryData.baked_type.isNotEmpty) {
                              TemporaryData.baked_type.remove("cakes");
                            }
                          }

                          widget.callback(selected);
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 35.dg,
                            right: 35.dg,
                            top: 22.dg,
                            bottom: 22.dg),
                        decoration: BoxDecoration(
                            color: selected[0] == true
                                ? GCConstants.quatenaryColor
                                : Colors.transparent,
                            border: Border.all(
                              color: selected[0] == true
                                  ? GCConstants.secondaryColor
                                  : const Color.fromRGBO(211, 192, 223, 1),
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Image.asset('assets/cake.png'),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Cakes",
                              style: TextStyle(
                                  color: GCConstants.primaryColor,
                                  fontSize: size.width <= 375
                                      ? 15.dg
                                      : size.width <= 515
                                          ? 13.dg
                                          : 16),
                            )
                          ],
                        ),
                      )),
                  SizedBox(
                    width: size.width * 0.01,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (selected[1] == false) {
                          selected[1] = true;
                          TemporaryData.baked_type.add("cupcakes");
                        } else {
                          selected[1] = false;
                          if (TemporaryData.baked_type.isNotEmpty) {
                            TemporaryData.baked_type.remove("cupcakes");
                          }
                        }
                        widget.callback(selected);
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                          left: 30.dg, right: 30.dg, top: 22.dg, bottom: 22.dg),
                      decoration: BoxDecoration(
                          color: selected[1] == true
                              ? GCConstants.quatenaryColor
                              : Colors.transparent,
                          border: Border.all(
                            color: selected[1] == false
                                ? const Color.fromRGBO(211, 192, 223, 1)
                                : GCConstants.secondaryColor,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Image.asset('assets/cupcake.png'),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Cupcake",
                            style: TextStyle(
                                color: GCConstants.primaryColor,
                                fontSize: size.width <= 375
                                    ? 15.dg
                                    : size.width <= 515
                                        ? 13.dg
                                        : 16),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.01,
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          if (selected[2] == false) {
                            selected[2] = true;
                            TemporaryData.baked_type.add("biscuits");
                          } else {
                            selected[2] = false;
                            if (TemporaryData.baked_type.isNotEmpty) {
                              TemporaryData.baked_type.remove("biscuits");
                            }
                          }
                          widget.callback(selected);
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 30.dg,
                            right: 30.dg,
                            top: 22.dg,
                            bottom: 22.dg),
                        decoration: BoxDecoration(
                            color: selected[2] == true
                                ? GCConstants.quatenaryColor
                                : Colors.transparent,
                            border: Border.all(
                              color: selected[2] == true
                                  ? GCConstants.secondaryColor
                                  : const Color.fromRGBO(211, 192, 223, 1),
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Image.asset('assets/biscuits.png'),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Biscuits",
                              style: TextStyle(
                                  color: GCConstants.primaryColor,
                                  fontSize: size.width <= 375
                                      ? 15.dg
                                      : size.width <= 515
                                          ? 13.dg
                                          : 16),
                            )
                          ],
                        ),
                      )),
                ],
              ),
              SizedBox(
                height: (size.height * 0.03),
              ),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text:
                          "Don't see something you bake? Make a suggestion here!",
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
                          fontWeight: FontWeight.w400,
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
                  controller: widget.suggController,
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.top,
                  cursorColor: GCConstants.borderColor,
                  expands: true,
                  minLines: null,
                  maxLines: null,
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
                    labelText: "Enter Suggestion",
                    labelStyle: TextStyle(
                        color: GCConstants.tertiaryTextColor,
                        fontSize: size.width <= 390
                            ? 20.dg
                            : size.width <= 515
                                ? 13.dg
                                : 50),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
