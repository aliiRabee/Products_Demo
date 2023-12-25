import 'dart:async';

import 'package:core/router/navigator_keys.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  @override
  void initState() {
    Timer(Duration(seconds: 2), () {
      Modular.to.navigate(NavigatorKeys.PRODUCTS_KEY);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container());
  }
}
