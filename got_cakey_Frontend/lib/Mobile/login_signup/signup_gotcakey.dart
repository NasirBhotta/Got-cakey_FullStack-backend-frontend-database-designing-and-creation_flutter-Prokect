import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:got_cakey_mobile/Mobile/Onboarding/Baker_Onboarding/Onboard_Struct.dart';
import 'package:got_cakey_mobile/utills/TextFields/text_fileds.dart';
import 'package:got_cakey_mobile/utills/constants/mobile_constants.dart';
import 'package:got_cakey_mobile/utills/services/auth_services.dart';
import 'package:got_cakey_mobile/model/auth.dart';
import 'package:got_cakey_mobile/provider/authProvider.dart';
import 'package:provider/provider.dart';

class GotCakeySignUp extends StatelessWidget {
  const GotCakeySignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: size.height * 0.1,
        backgroundColor: const Color.fromRGBO(80, 12, 127, 1),
        shadowColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Image.asset('assets/back.png')),
      ),
      backgroundColor: const Color.fromRGBO(80, 12, 127, 1),
      body: const SignUpBody(),
    );
  }
}

class SignUpBody extends StatefulWidget {
  const SignUpBody({super.key});

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _postcodeController = TextEditingController();
  final AuthService authService = AuthService();
  String email = '';
  bool isChecked = false;
  bool selected = false;
  String postcode = '';
  bool clicked = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Future<Map<String, dynamic>> signUp() async {
    final res = authService.signUpUser(
        context: context,
        email: _emailController.text,
        name: "",
        password: _passwordController.text);
    await Future.delayed(const Duration(seconds: 2));
    return res;
  }

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<AuthProvider>(context).user;
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: size.height >= 667
                    ? size.height * 0.04
                    : size.height * 0.04,
              ),
              Center(
                child: Text(
                  "Set up your account",
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      color: GCConstants.whiteColor,
                      fontSize: GCConstants(size: size).secFontSize()),
                ),
              ),
              SizedBox(
                height: size.height >= 667
                    ? size.height * 0.04
                    : size.height * 0.04,
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "Email",
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: Colors.white,
                        fontSize: GCConstants(size: size).fontsize())),
                const TextSpan(text: " ", style: TextStyle(fontSize: 15)),
                TextSpan(
                    text: "*",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: GCConstants(size: size).fontsize(),
                        fontWeight: FontWeight.w500))
              ])),
              const SizedBox(
                height: 3,
              ),
              CustomTextField(
                controller: _emailController,
                necessary: true,
                title: "Email",
                labeltext: "Email",
                onSaved: (value) {
                  if (value!.isNotEmpty) {
                    email = value;
                  }
                },
                type: '',
              ),
              SizedBox(
                height: (size.height * 0.03),
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "Password",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: GCConstants(size: size).fontsize(),
                        fontWeight: FontWeight.w500)),
                const TextSpan(text: " ", style: TextStyle(fontSize: 15)),
                TextSpan(
                    text: "*",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: GCConstants(size: size).fontsize(),
                        fontWeight: FontWeight.w500))
              ])),
              const SizedBox(
                height: 3,
              ),
              CustomTextField(
                controller: _passwordController,
                necessary: true,
                title: "Password",
                labeltext: "Password",
                onSaved: (value) {
                  if (value!.isNotEmpty) {
                    email = value;
                  }
                },
                type: '',
              ),
              SizedBox(
                height: (size.height * 0.03),
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "Postcode",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: GCConstants(size: size).fontsize(),
                        fontWeight: FontWeight.w500)),
                const TextSpan(text: " ", style: TextStyle(fontSize: 15)),
                TextSpan(
                    text: "*",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: GCConstants(size: size).fontsize(),
                        fontWeight: FontWeight.w500))
              ])),
              const SizedBox(
                height: 3,
              ),
              CustomTextField(
                controller: _postcodeController,
                title: "Postcode",
                labeltext: "Postcode",
                necessary: true,
                onSaved: (value) {
                  if (value!.isNotEmpty) {
                    email = value;
                  }
                },
                type: '',
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "What will you use Got Cakey for?",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: GCConstants(size: size).fontsize(),
                        fontWeight: FontWeight.w500)),
                const TextSpan(text: " ", style: TextStyle(fontSize: 15)),
                TextSpan(
                    text: "*",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: GCConstants(size: size).fontsize(),
                        fontWeight: FontWeight.w500))
              ])),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          if (selected == true) {
                            selected = false;
                          }
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 7.dg, right: 7.dg, top: 28.dg, bottom: 28.dg),
                        decoration: BoxDecoration(
                            color: selected == false
                                ? const Color.fromRGBO(146, 4, 190, 1)
                                : Colors.transparent,
                            border: Border.all(
                              color: selected == false
                                  ? const Color.fromRGBO(255, 111, 97, 1)
                                  : const Color.fromRGBO(211, 192, 223, 1),
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Image.asset('assets/gogels.png'),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Finding local bakers",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: size.height <= 390
                                      ? 15.dg
                                      : size.height <= 515
                                          ? 11.dg
                                          : 11),
                            )
                          ],
                        ),
                      )),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (selected == false) {
                          selected = true;
                        }
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                          left: size.width >= 355 ? 30.dg : size.width * 0.08,
                          right: size.width >= 355 ? 30.dg : size.width * 0.08,
                          top: 23.dg,
                          bottom: 23.dg),
                      decoration: BoxDecoration(
                          color: selected == true
                              ? const Color.fromRGBO(146, 4, 190, 1)
                              : Colors.transparent,
                          border: Border.all(
                            color: selected == false
                                ? const Color.fromRGBO(211, 192, 223, 1)
                                : const Color.fromRGBO(255, 111, 97, 1),
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Image.asset('assets/dollarcake.png'),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Selling cakes",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: size.height <= 390
                                    ? 15.dg
                                    : size.height <= 515
                                        ? 11.dg
                                        : 11),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox.adaptive(
                    activeColor: const Color.fromRGBO(146, 4, 190, 1),
                    side: const BorderSide(width: 1, strokeAlign: 2),
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  SizedBox(
                    width: 10.dg,
                  ),
                  Expanded(
                    child: Text(
                      "I do not want to receive the information on product updates or the sweetest marketing material.",
                      style: TextStyle(
                          color: const Color.fromRGBO(255, 255, 255, 1),
                          fontSize: size.height <= 390
                              ? 11.dg
                              : size.height <= 515
                                  ? 12.dg
                                  : 9),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              _createElevatedButton(
                  "${MediaQuery.of(context).devicePixelRatio}",
                  const Color.fromRGBO(255, 111, 97, 1),
                  size,
                  user),
              SizedBox(
                height: size.height * 0.08,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _createElevatedButton(
      String value, Color color, Size size, User user) {
    return ElevatedButton(
      onPressed: () async {
        if (!_formKey.currentState!.validate()) {
          return;
        } else {
          setState(() {
            clicked = true;
          });
          final res = await signUp();
          if (!mounted) return;
          if (res['token'] != null && res['token'] != '') {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const OnboardStruct(),
                ));
            setState(() {
              clicked = false;
            });
          } else {
            setState(() {
              clicked = false;
            });
          }
        }
        _formKey.currentState!.save();
      },
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
                color: const Color.fromRGBO(57, 9, 92, 1),
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
}
