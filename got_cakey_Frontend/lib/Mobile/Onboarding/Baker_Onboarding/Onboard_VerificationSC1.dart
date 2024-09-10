// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:got_cakey_mobile/utills/TextFields/text_fileds.dart';
import 'package:got_cakey_mobile/utills/constants/mobile_constants.dart';
import 'package:got_cakey_mobile/utills/tem_data_holder.dart';

// import 'package:got_cakey_mobile/Mobile/Onboarding/Baker_Onboarding/CustomPainterClass.dart';
enum RegistrationStatus { registered, notRegistered }

class GCOnboardSC1 extends StatefulWidget {
  final TextEditingController businessNameCont;
  final GlobalKey<FormState> formKey;
  const GCOnboardSC1({
    super.key,
    required this.businessNameCont,
    required this.formKey,
  });

  @override
  State<GCOnboardSC1> createState() => _GCOnboardSC1State();
}

class _GCOnboardSC1State extends State<GCOnboardSC1> {
  String? _selectedValue = "Select a issuing state";
  RegistrationStatus _value = RegistrationStatus.notRegistered;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Form(
          key: widget.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: (size.height * 0.03),
              ),
              Text("Upload proof of registration",
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
                      text:
                          "Upload proof of registration with your local state or territory",
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
              Container(
                decoration: DottedDecoration(
                    shape: Shape.box,
                    color: const Color.fromRGBO(146, 4, 190, 1),
                    borderRadius: BorderRadius.circular(10)),
                height: 100,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/add.png'),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Click here to add and",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Nordo',
                                  fontWeight: FontWeight.w400,
                                  fontSize:
                                      GCConstants(size: size).fontsize())),
                          Text("upload documents",
                              style: TextStyle(
                                  color: GCConstants.secondaryColor,
                                  fontFamily: 'Nordo',
                                  fontWeight: FontWeight.w400,
                                  fontSize:
                                      GCConstants(size: size).fontsize())),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: (size.height * 0.02),
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "Issuing state or territory",
                    style: TextStyle(
                        color: GCConstants.primaryColor,
                        fontFamily: 'Nordo',
                        fontWeight: FontWeight.bold,
                        fontSize: GCConstants(size: size).fontsize())),
                const TextSpan(text: " *")
              ])),
              SizedBox(
                height: (size.height * 0.01),
              ),
              DropdownButtonFormField(
                validator: (value) {
                  print(value);
                  if (value == "Select a issuing state") {
                    return "Select a state";
                  }
                  return null;
                },
                decoration: InputDecoration(
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
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: GCConstants.borderColor,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: GCConstants.secondaryColor,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    contentPadding: EdgeInsets.only(
                        top: GCConstants(size: size).gcButtonPaddingTop(),
                        bottom: GCConstants(size: size).gcButtonPaddingBottom(),
                        left: 10,
                        right: 10)),
                style: const TextStyle(
                    fontFamily: 'Nordo', fontWeight: FontWeight.normal),
                value: _selectedValue,
                icon: const Expanded(
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Icon(Icons.keyboard_arrow_down))),
                items: [
                  DropdownMenuItem<String>(
                    value: "Select a issuing state",
                    child: Text(
                      "Select a issuing state",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Nordo',
                          fontWeight: FontWeight.w400,
                          fontSize: GCConstants(size: size).textFieldFont()),
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
                          fontSize: GCConstants(size: size).textFieldFont()),
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "England",
                    child: Text("England",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Nordo',
                            fontWeight: FontWeight.w400,
                            fontSize: GCConstants(size: size).textFieldFont())),
                  ),
                  DropdownMenuItem<String>(
                    value: "Pakistan",
                    child: Text("Pakistan",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Nordo',
                            fontWeight: FontWeight.w400,
                            fontSize: GCConstants(size: size).textFieldFont())),
                  )
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedValue = value;
                  });
                  TemporaryData.issuing_state = _selectedValue!;
                },
              ),
              SizedBox(
                height: (size.height * 0.02),
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "Business Name",
                    style: TextStyle(
                        color: GCConstants.primaryColor,
                        fontFamily: 'Nordo',
                        fontWeight: FontWeight.bold,
                        fontSize: GCConstants(size: size).fontsize())),
                const TextSpan(text: " *")
              ])),
              SizedBox(
                height: (size.height * 0.01),
              ),
              CustomTextField(
                title: "Business Name",
                labeltext: "Enter business name",
                onSaved: (value) {},
                necessary: true,
                controller: widget.businessNameCont,
                type: "verification",
              ),
              SizedBox(
                height: (size.height * 0.02),
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "GST registration status",
                    style: TextStyle(
                        color: GCConstants.primaryColor,
                        fontFamily: 'Nordo',
                        fontWeight: FontWeight.bold,
                        fontSize: GCConstants(size: size).fontsize())),
                const TextSpan(text: " *")
              ])),
              Column(
                children: [
                  Row(
                    children: [
                      Radio<RegistrationStatus>(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        focusColor: const Color.fromRGBO(146, 4, 190, 1),
                        fillColor: const WidgetStatePropertyAll(
                            Color.fromRGBO(146, 4, 190, 1)),
                        value: RegistrationStatus.notRegistered,
                        groupValue: _value,
                        visualDensity: VisualDensity.standard,
                        onChanged: (RegistrationStatus? value) {
                          setState(() {
                            _value = value!;
                            TemporaryData.registration_status =
                                "Not Registered";
                          });
                        },
                      ),
                      Text("Not registered for GST ",
                          style: TextStyle(
                              color: GCConstants.primaryColor,
                              fontFamily: 'Nordo',
                              fontWeight: FontWeight.bold,
                              fontSize: GCConstants(size: size).fontsize()))
                    ],
                  ),
                  Row(
                    children: [
                      Radio<RegistrationStatus>(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        focusColor: const Color.fromRGBO(146, 4, 190, 1),
                        fillColor: const WidgetStatePropertyAll(
                            Color.fromRGBO(146, 4, 190, 1)),
                        value: RegistrationStatus.registered,
                        groupValue: _value,
                        onChanged: (RegistrationStatus? value) {
                          setState(() {
                            _value = value!;
                            TemporaryData.registration_status = "Registered";
                          });
                        },
                      ),
                      Text("Registered for GST ",
                          style: TextStyle(
                              color: GCConstants.primaryColor,
                              fontFamily: 'Nordo',
                              fontWeight: FontWeight.bold,
                              fontSize: GCConstants(size: size).fontsize()))
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: (size.height * 0.03),
              ),
              Row(
                children: [
                  GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        size: 25,
                        Icons.info_outline,
                        color: Color.fromRGBO(146, 4, 190, 1),
                      )),
                  Text("Proof of registration information",
                      style: TextStyle(
                          color: GCConstants.primaryColor,
                          fontFamily: 'Nordo',
                          fontWeight: FontWeight.bold,
                          fontSize: 11))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
