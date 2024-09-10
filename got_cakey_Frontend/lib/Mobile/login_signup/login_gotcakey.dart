import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:got_cakey_mobile/utills/TextFields/text_fileds.dart';
import 'package:got_cakey_mobile/utills/constants/mobile_constants.dart';
import 'package:got_cakey_mobile/Mobile/main_screens/onboarding_verified_baker.dart';
import 'package:got_cakey_mobile/utills/services/auth_services.dart';
// import 'package:got_cakey_mobile/model/auth.dart';

class GotCakeyLogin extends StatefulWidget {
  const GotCakeyLogin({super.key});

  @override
  State<GotCakeyLogin> createState() => _GotCakeyLoginState();
}

class _GotCakeyLoginState extends State<GotCakeyLogin> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
      body: const Padding(
        padding: EdgeInsets.only(left: 30, right: 30),
        child: LoginBody(),
      ),
    );
  }
}

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  AuthService authService = AuthService();
  String email = '';
  bool clicked = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<Map<String, dynamic>> loginUser() async {
    final res = authService.signInUser(
        context: context,
        email: _emailController.text,
        password: _passwordController.text);
    await Future.delayed(const Duration(seconds: 2));
    return res;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Image.asset(
                  'assets/login.png',
                  fit: BoxFit.cover,
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
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: GCConstants(size: size).fontsize(),
                        fontWeight: FontWeight.w500)),
                TextSpan(
                    text: " ",
                    style: TextStyle(
                        fontSize: GCConstants(size: size).fontsize(),
                        fontWeight: FontWeight.w500)),
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
                TextSpan(
                    text: " ",
                    style: TextStyle(
                        fontSize: GCConstants(size: size).fontsize(),
                        fontWeight: FontWeight.w500)),
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
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                width: double.infinity,
                child: Align(
                    alignment: Alignment.centerRight,
                    child: _createTextButton(
                        "Forgot password?", Colors.white, size)),
              ),
              SizedBox(
                height: size.height * 0.036,
              ),
              _createElevatedButton("Log in",
                  const Color.fromRGBO(255, 111, 97, 1), size, context),
              SizedBox(
                height: size.height * 0.012,
              ),
              Container(
                padding: const EdgeInsets.only(left: 15, right: 15),
                height: 15,
                child: const Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Text("OR"),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.012,
              ),
              _createElevatedButton("Continue with Google",
                  const Color.fromRGBO(255, 255, 255, 1), size, context),
              SizedBox(
                height: size.height * 0.01,
              ),
              _createElevatedButton("Continue with Facebook",
                  const Color.fromRGBO(255, 255, 255, 1), size, context),
              SizedBox(
                height: size.height * 0.06,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an Account?",
                    style:
                        TextStyle(fontSize: GCConstants(size: size).fontsize()),
                  ),
                  _createTextButton("Sign up", Colors.white, size)
                ],
              )
            ],
          ),
        ),
      );
    });
  }

  Widget _createElevatedButton(
      String value, Color color, Size size, BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        if (!_formKey.currentState!.validate()) {
          return;
        } else {
          setState(() {
            clicked = true;
          });
          final res = await loginUser();
          if (!mounted) return;
          if (res['token'] != null && res['token'] != '') {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const GCVerifiedBaker(),
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

Widget _createTextButton(String value, Color color, Size size) {
  return TextButton(
      onPressed: () {},
      style: const ButtonStyle(
          padding: WidgetStatePropertyAll(EdgeInsets.zero),
          overlayColor: WidgetStatePropertyAll(Colors.transparent)),
      child: Text(
        value,
        style: TextStyle(
            color: color, fontSize: GCConstants(size: size).fontsize()),
      ));
}
