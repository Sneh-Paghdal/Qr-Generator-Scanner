import 'package:flutter/material.dart';
import 'package:qrgenerator/Utils/constant.dart';

class history_page extends StatefulWidget {
  const history_page({Key? key}) : super(key: key);

  @override
  State<history_page> createState() => _history_pageState();
}

class _history_pageState extends State<history_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constant.screenBackClr,
      appBar: AppBar(
        backgroundColor: constant.screenBackClr,
        title: Text("History",style: TextStyle(fontSize: constant.headingTxtSize,color: constant.primaryFontClr,fontWeight: constant.heighlitedFontWeight),),
      ),
      body: Center(
        child: Container(
          height: 100,
          child: Column(
            children: [
              Icon(Icons.hourglass_empty_outlined,color: constant.secondaryFontClr,size: 55,),
              SizedBox(height: 10,),
              Text("No History",style: TextStyle(color: constant.secondaryFontClr),)
            ],
          ),
        ),
      ),
    );
  }
}
