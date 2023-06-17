import 'package:flutter/material.dart';
import 'package:qrgenerator/Utils/constant.dart';

class privacy_policy_page extends StatefulWidget {
  const privacy_policy_page({Key? key}) : super(key: key);

  @override
  State<privacy_policy_page> createState() => _privacy_policy_pageState();
}

class _privacy_policy_pageState extends State<privacy_policy_page> {
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
        title: Text("Privacy Policy",style: TextStyle(fontSize: constant.headingTxtSize,color: constant.primaryFontClr,fontWeight: constant.heighlitedFontWeight),),
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
