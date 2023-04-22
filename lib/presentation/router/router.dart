import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/screens/home/home_page.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoute() {
    return <String, WidgetBuilder>{
      '/home': (BuildContext context) => const HomePage(),
    };
  }
}
