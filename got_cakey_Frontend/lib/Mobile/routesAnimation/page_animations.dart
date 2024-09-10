import 'package:flutter/material.dart';
import 'package:got_cakey_mobile/Mobile/got_cakey_mobile.dart';
import 'package:got_cakey_mobile/Mobile/login_signup/login_gotcakey.dart';
import 'package:got_cakey_mobile/Mobile/login_signup/signup_gotcakey.dart';

Route generateRoute(RouteSettings settings) {
  WidgetBuilder builder;
  switch (settings.name) {
    case '/login':
      builder = (BuildContext _) => const GotCakeyLogin();
      break;
    case '/signup':
      builder = (BuildContext _) => const GotCakeySignUp();
      break;
    default:
      builder = (BuildContext _) => const GotCakeyMobile();
  }

  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => builder(context),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      switch (settings.name) {
        case '/login':
          return _slideTransition(animation, child);
        case '/signup':
          return _slideTransition(animation, child);
        default:
          return _slideTransition(animation, child);
      }
    },
  );
}

Widget _slideTransition(Animation<double> animation, Widget child) {
  const begin = Offset(0.0, 1.0);
  const end = Offset(1.0, 0.0);
  const curve = Curves.ease;

  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
  var offsetAnimation = animation.drive(tween);

  return SlideTransition(
    position: offsetAnimation,
    child: child,
  );
}
