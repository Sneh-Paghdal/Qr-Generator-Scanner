import 'package:flutter/material.dart';
import 'package:qrgenerator/Utils/constant.dart';

class setting_page extends StatefulWidget {
  const setting_page({Key? key}) : super(key: key);

  @override
  State<setting_page> createState() => _setting_pageState();
}

class _setting_pageState extends State<setting_page> {

  bool isClipSwitched = false;

  clipSwitch(bool value){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constant.screenBackClr,
      appBar: AppBar(
        backgroundColor: constant.screenBackClr,
        title: Text("Settings",style: TextStyle(fontSize: constant.headingTxtSize,color: constant.primaryFontClr,fontWeight: constant.heighlitedFontWeight),),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(height: 20,),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Text("General Settings",style: TextStyle(color: Colors.blue,fontWeight: constant.heighlitedFontWeight),),
          ),
          Container(
            // height: 60,
            decoration: BoxDecoration(
                color: constant.secondaryBackClr,
                borderRadius: BorderRadius.circular(10)
            ),
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          child: Text("Auto-copied to clipboard",style: TextStyle(fontSize: 15,color: constant.primaryFontClr,fontWeight: constant.heighlitedFontWeight),),
                        )
                      ],
                    ),
                    Container(
                        margin: EdgeInsets.only(right: 10),
                        child: Transform.scale(
                          scale: 0.8,
                          child: Switch(
                            onChanged: clipSwitch,
                            value: isClipSwitched,
                            activeColor: Colors.grey,
                            activeTrackColor: Colors.white,
                            inactiveThumbColor: Colors.white,
                            inactiveTrackColor: Colors.grey,
                          ),
                        )),
                  ],
                ),
                Divider(
                  indent: 10,
                  endIndent: 10,
                  color: constant.screenBackClr,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          child: Text("Save History",style: TextStyle(fontSize: 15,color: constant.primaryFontClr,fontWeight: constant.heighlitedFontWeight),),
                        )
                      ],
                    ),
                    Container(
                        margin: EdgeInsets.only(right: 10),
                        child: Transform.scale(
                          scale: 0.8,
                          child: Switch(
                            onChanged: clipSwitch,
                            value: isClipSwitched,
                            activeColor: Colors.grey,
                            activeTrackColor: Colors.white,
                            inactiveThumbColor: Colors.white,
                            inactiveTrackColor: Colors.grey,
                          ),
                        )),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 15,),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Text("Help",style: TextStyle(color: Colors.blue,fontWeight: constant.heighlitedFontWeight),),
          ),
          Container(
            // height: 60,
            decoration: BoxDecoration(
                color: constant.secondaryBackClr,
                borderRadius: BorderRadius.circular(10)
            ),
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10,bottom: 10),
                      child: Text("Rate Us",style: TextStyle(fontSize: 15,color: constant.primaryFontClr,fontWeight: constant.heighlitedFontWeight),),
                    )
                  ],
                ),
                Divider(
                  indent: 10,
                  endIndent: 10,
                  color: constant.screenBackClr,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10,bottom: 10),
                      child: Text("Check Our Apps",style: TextStyle(fontSize: 15,color: constant.primaryFontClr,fontWeight: constant.heighlitedFontWeight),),
                    )
                  ],
                ),
                Divider(
                  indent: 10,
                  endIndent: 10,
                  color: constant.screenBackClr,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10,bottom: 10),
                      child: Text("About Us",style: TextStyle(fontSize: 15,color: constant.primaryFontClr,fontWeight: constant.heighlitedFontWeight),),
                    )
                  ],
                ),
                Divider(
                  indent: 10,
                  endIndent: 10,
                  color: constant.screenBackClr,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10,bottom: 10),
                      child: Text("Privacy Policy",style: TextStyle(fontSize: 15,color: constant.primaryFontClr,fontWeight: constant.heighlitedFontWeight),),
                    )
                  ],
                ),
                Divider(
                  indent: 10,
                  endIndent: 10,
                  color: constant.screenBackClr,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10,bottom: 10),
                      child: Text("Terms And Condition",style: TextStyle(fontSize: 15,color: constant.primaryFontClr,fontWeight: constant.heighlitedFontWeight),),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
