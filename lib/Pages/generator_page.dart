import 'package:flutter/material.dart';
import 'package:qrgenerator/Utils/constant.dart';
import 'package:qrgenerator/main.dart';

class generator_page extends StatefulWidget {
  const generator_page({Key? key}) : super(key: key);

  @override
  State<generator_page> createState() => _generator_pageState();
}

class _generator_pageState extends State<generator_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constant.screenBackClr,
      appBar: AppBar(
        backgroundColor: constant.screenBackClr,
        title: Text("Generate",style: TextStyle(fontSize: constant.headingTxtSize,color: constant.primaryFontClr,fontWeight: constant.heighlitedFontWeight),),
      ),
      body: Column(
        children: [
          Container(
            height: 60,
            decoration: BoxDecoration(
              color: constant.secondaryBackClr,
              borderRadius: BorderRadius.circular(10)
            ),
            margin: EdgeInsets.all(10),
            child: InkWell(
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage(selectedIndex: 1)));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.history,color: Colors.blue,),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        child: Text("History",style: TextStyle(fontSize: 17,color: constant.primaryFontClr,fontWeight: constant.heighlitedFontWeight),),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                      child: Icon(
                        Icons.keyboard_arrow_right,color: Colors.white,)),
                ],
              ),
            ),
          ),
          Container(
            height: 60,
            decoration: BoxDecoration(
                color: constant.secondaryBackClr,
                borderRadius: BorderRadius.circular(10)
            ),
            margin: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.copy_all_outlined,color: Colors.blue,),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      child: Text("Clipboard",style: TextStyle(fontSize: 17,color: constant.primaryFontClr,fontWeight: constant.heighlitedFontWeight),),
                    )
                  ],
                ),
                Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.keyboard_arrow_right,color: Colors.white,)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
