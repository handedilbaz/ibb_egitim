// [ This is an auto generated file ]

import 'package:flutter/material.dart';
import 'package:fsc_ibb/core/router_constants.dart';

import 'package:fsc_ibb/views/splash/splash_view.dart' as view0;
import 'package:fsc_ibb/views/home/home_view.dart' as view1;
import 'package:fsc_ibb/views/calls/call_view.dart' as view2;
import 'package:fsc_ibb/views/chats/chat_view.dart' as view3;

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashViewRoute:
        return MaterialPageRoute(builder: (_) => view0.SplashView());

      case homeViewRoute:
        return MaterialPageRoute(builder: (_) => view1.HomeView());
      case callViewRoute:
        return MaterialPageRoute(builder: (_) => view2.CallView());
      case chatViewRoute:
        return MaterialPageRoute(builder: (_) => view3.ChatView());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
