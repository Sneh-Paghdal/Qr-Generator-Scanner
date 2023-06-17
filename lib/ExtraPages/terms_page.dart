import 'package:flutter/material.dart';
import 'package:qrgenerator/Utils/constant.dart';

class terms_page extends StatefulWidget {
  const terms_page({Key? key}) : super(key: key);

  @override
  State<terms_page> createState() => _terms_pageState();
}

class _terms_pageState extends State<terms_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constant.screenBackClr,
      appBar: AppBar(
        backgroundColor: constant.screenBackClr,
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(
            Icons.chevron_left,
            color: Colors.white,
            size: 27,
          ),
        ),
        centerTitle: true,
        title: Text("Terms & Conditions",style: TextStyle(fontSize: constant.headingTxtSize,color: constant.primaryFontClr,fontWeight: constant.heighlitedFontWeight),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Text("")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
