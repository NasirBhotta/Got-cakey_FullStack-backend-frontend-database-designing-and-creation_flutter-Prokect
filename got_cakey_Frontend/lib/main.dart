import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:got_cakey_mobile/Mobile/got_cakey_mobile.dart';
// import 'package:got_cakey_mobile/Mobile/got_cakey_mobile.dart';
// import 'package:got_cakey_mobile/Mobile/main_screens/onboarding_verified_baker.dart';
// import 'package:got_cakey_mobile/Mobile/got_cakey_mobile.dart';
// import 'package:got_cakey_mobile/Mobile/main_screens/onboarding_verified_baker.dart';

// import 'package:got_cakey_mobile/Mobile/got_cakey_mobile.dart';
// import 'package:go_router/go_router.dart';
// import 'package:got_cakey/Mobile/Baker_Onboarding/Onboard_Struct.dart';
// import 'package:got_cakey/Mobile/Go_router/goRouter_config.dart';
// import 'package:got_cakey/Mobile/login_signup/login_gotcakey.dart';
// import 'package:got_cakey/Mobile/login_signup/signup_gotcakey.dart';
import 'package:got_cakey_mobile/Web/got_cakey_web.dart';
import 'package:got_cakey_mobile/provider/authProvider.dart';
import 'package:got_cakey_mobile/provider/userInfo.dart';
import 'package:got_cakey_mobile/utills/constants/themes.dart';
import 'package:provider/provider.dart';
// import 'package:url_strategy/url_strategy.dart';

void main() {
  // setPathUrlStrategy();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => AuthProvider()),
    ChangeNotifierProvider(
      create: (_) => UserinfoProvider(),
    )
  ], child: const GotCakeyHome()));
}

// ignore: must_be_immutable
class GotCakeyHome extends StatelessWidget {
  const GotCakeyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: (context, child) => MaterialApp(
        theme: GCThemes.lightTheme,
        themeMode: ThemeMode.system,
        title: "Got Cakey",
        debugShowCheckedModeBanner: false,
        home: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth >= 600) {
              return const GotCakeyWeb();
            } else {
              return const GotCakeyMobile();
            }
          },
        ),
      ),
    );
  }

  // GoRouter router = GoRouter(routes: [
  //   GoRoute(
  //     path: '/',
  //     name: "home",
  //     builder: (context, state) {
  //       return const GotCakeyMobile();
  //     },
  //   ),
  //   GoRoute(
  //     path: '/login',
  //     name: "login",
  //     builder: (context, state) {
  //       return const GotCakeyLogin();
  //     },
  //   ),
  //   GoRoute(
  //     path: '/signup',
  //     name: 'signup',
  //     builder: (context, state) {
  //       return const GotCakeySignUp();
  //     },
  //   )
  // ]);
}
