import 'dart:async';

import 'package:flutter/material.dart';
import 'package:yaqoob_test_project/Pages/bottom_bar/bottom_bar.dart';

import '../../const.dart';

class SplishScreen extends StatefulWidget {
  const SplishScreen({super.key});
  @override
  State<SplishScreen> createState() => _SplishScreenState();
}

class _SplishScreenState extends State<SplishScreen> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 3),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => const BottomBar(),
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(splashImage),
          ),
        ),
      ),
    );
  }
}
