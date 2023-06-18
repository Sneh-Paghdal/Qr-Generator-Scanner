import 'package:flutter/material.dart';
import 'package:qrgenerator/ExtraPages/about_us.dart';
import 'package:qrgenerator/ExtraPages/privacy_policy_page.dart';
import 'package:qrgenerator/ExtraPages/terms_page.dart';
import 'package:qrgenerator/Utils/constant.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_redirect/store_redirect.dart';
import 'package:url_launcher/url_launcher.dart';

class setting_page extends StatefulWidget {
  const setting_page({Key? key}) : super(key: key);

  @override
  State<setting_page> createState() => _setting_pageState();
}

class _setting_pageState extends State<setting_page> {

  bool isCopySwitchedOn = false;
  bool isHistorySwitchedOn = false;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  historySwitch(bool value) async {
    setState(() {
        isHistorySwitchedOn = value;
    });
    if(value){
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool("isHistory", true);
    }else{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool("isHistory", false);
    }
  }

  copySwitch(bool value) async {
    setState(() {
        isCopySwitchedOn = value;
    });
    if(value){
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool("isCopy", true);
      print(value);
    }else{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool("isCopy", false);
    }
  }

  fetchData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isCopySwitchedOn = prefs.getBool("isCopy") ?? false;
      isHistorySwitchedOn = prefs.getBool("isHistory") ?? true;
      print(isCopySwitchedOn);
      print(isHistorySwitchedOn);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constant.screenBackClr,
      appBar: AppBar(
        backgroundColor: constant.screenBackClr,
        title: Text("Settings",style: TextStyle(fontSize: constant.headingTxtSize,color: constant.primaryFontClr,fontWeight: constant.heighlitedFontWeight),),
      ),
      body: SingleChildScrollView(
        child: Column(
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
                              onChanged: copySwitch,
                              value: isCopySwitchedOn,
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
                              onChanged: historySwitch,
                              value: isHistorySwitchedOn,
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
                      InkWell(
                        onTap: (){
                          showDialog(
                            context: context,
                            builder: (context) => _dialog,
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.only(top: 10,bottom: 10),
                          child: Text("Rate Us",style: TextStyle(fontSize: 15,color: constant.primaryFontClr,fontWeight: constant.heighlitedFontWeight),),
                        ),
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
                      InkWell(
                        onTap: () async {
                          const url = 'https://play.google.com/store/apps/developer?id=Jasneh Studio'; // Replace with your Play Store developer URL
                          if (await canLaunch(url)) {
                          await launch(url);
                          } else {
                          throw 'Could not launch $url';
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.only(top: 10,bottom: 10),
                          child: Text("Check Our Apps",style: TextStyle(fontSize: 15,color: constant.primaryFontClr,fontWeight: constant.heighlitedFontWeight),),
                        ),
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
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => about_us()));
                        },
                        child: Container(
                          padding: EdgeInsets.only(top: 10,bottom: 10),
                          child: Text("About Us",style: TextStyle(fontSize: 15,color: constant.primaryFontClr,fontWeight: constant.heighlitedFontWeight),),
                        ),
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
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => privacy_policy_page()));
                        },
                        child: Container(
                          padding: EdgeInsets.only(top: 10,bottom: 10),
                          child: Text("Privacy Policy",style: TextStyle(fontSize: 15,color: constant.primaryFontClr,fontWeight: constant.heighlitedFontWeight),),
                        ),
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
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => terms_page()));
                        },
                        child: Container(
                          padding: EdgeInsets.only(top: 10,bottom: 10),
                          child: Text("Terms And Condition",style: TextStyle(fontSize: 15,color: constant.primaryFontClr,fontWeight: constant.heighlitedFontWeight),),
                        ),
                      )
                    ],
                  ),
                ],
              ),
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
                        child: Text("Version : 1.0.0",style: TextStyle(fontSize: 15,color: constant.primaryFontClr,fontWeight: constant.heighlitedFontWeight),),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
                alignment: Alignment.center,
                margin: EdgeInsets.all(10),
                child: Text("Made In India With ❤️",style: TextStyle(fontSize: 16,fontWeight: constant.heighlitedFontWeight,color: constant.primaryFontClr),)
            )
          ],
        ),
      ),
    );
  }

  final _dialog = RatingDialog(
    title: Text('Rate Us On Play Store',style: TextStyle(fontSize: 17),),
    message:
    Text('Rate us with 5 shining stars and light up our day!',style: TextStyle(fontSize: 15),),
    // your app's logo?
    image: Image.asset('assets/images/appLogo.png',width: 60,height: 60,),
    initialRating: 5,
    onCancelled: () => print('cancelled'),
    starSize: 35,
    enableComment: false,
    onSubmitted: (response) {
      print('rating: ${response.rating}, comment: ${response.comment}');
      // if (response.rating < 3.0) {
      // } else {
      // }
      StoreRedirect.redirect(androidAppId: 'qrcodescanner.barcodescanner.qrscanner.qrcodereader.qrgenerator.jasnehstudio',iOSAppId: 'qrcodescanner.barcodescanner.qrscanner.qrcodereader.qrgenerator.jasnehstudio');
    }, submitButtonText: 'Submit',
  );

}
