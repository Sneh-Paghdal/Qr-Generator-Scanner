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

class _splash_screenState extends State<splash_screen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage(selectedIndex: 0)));
    });
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
      body: Center( child : Text("Here will be image")),
    );
  }
}
