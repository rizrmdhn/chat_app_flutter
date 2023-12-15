import 'package:auth/presentation/pages/login_page.dart';
import 'package:auth/presentation/pages/register_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:message/presentation/pages/message_page.dart';
import 'package:splash/presentation/pages/splash_page.dart';

Function routes = (RouteSettings settings) {
  switch (settings.name) {
    case '/home':
      return MaterialPageRoute(
        builder: (_) => const SplashPage(),
      );
    case '/login':
      return CupertinoPageRoute(
        builder: (_) => const LoginPage(),
      );
    case '/register':
      return CupertinoPageRoute(
        builder: (_) => const RegisterPage(),
      );
    case '/chat/message':
      return CupertinoPageRoute(
        builder: (_) => const MessagePage(),
      );
    default:
      return MaterialPageRoute(
        builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('Page not found :('),
            ),
          );
        },
      );
  }
};
