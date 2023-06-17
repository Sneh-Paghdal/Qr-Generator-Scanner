import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qrgenerator/Pages/scanner_page.dart';
import 'package:qrgenerator/Utils/constant.dart';
import 'package:qrgenerator/main.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({Key? key}) : super(key: key);

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  late Animation<double> _opacityAnimation;



  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.forward();
    Timer(Duration(seconds: 4),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage(selectedIndex: 0)));
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constant.secondaryBackClr,
      bottomNavigationBar: Container(
        height: 4,
        width: 200,
        margin: EdgeInsets.only(bottom: 30,left: 70,right: 70),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: LinearProgressIndicator(
            backgroundColor: constant.splashLnrPrgrssecondary,
            color: constant.splashLnrPrgrsMain,
          ),
        ),
      ),
      body: Center(
          child : Container(
            width: 250,
            child: SlideTransition(
              position: _offsetAnimation,
              child: FadeInImage(
                placeholder: AssetImage('assets/images/splashLogo.png'),
                image: AssetImage('assets/images/splashLogo.png'),
              ),
            ),
          )),
    );
  }
}
