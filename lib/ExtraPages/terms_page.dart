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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: constant.secondaryBackClr
              ),
              child: Column(
                children: [
                  Text(
                    'Welcome to Jasneh! By using our QR code scanning and QR code generator app, you agree to the following terms and conditions:',
                    style: TextStyle(fontSize: 13.0,
                        color: Colors.white),
                  ),
                  SizedBox(height: 12.0),
                  Text(
                    'App Usage:',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'You may use our app for personal, non-commercial purposes.\n'
                        'You agree not to use the app for any illegal or unauthorized purpose.\n'
                        'You are responsible for maintaining the confidentiality of your account information and for all activities that occur under your account.',
                    style: TextStyle(fontSize: 12.0,
                        color: Colors.white),
                  ),
                  SizedBox(height: 12.0),
                  Text(
                    'Intellectual Property:',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Our app and its content, including but not limited to logos, trademarks, and designs, are the property of Jasneh and are protected by intellectual property laws.\n'
                        'You agree not to reproduce, distribute, modify, or create derivative works based on our app without our prior written consent.',
                    style: TextStyle(fontSize: 12.0,
                        color: Colors.white),
                  ),
                  SizedBox(height: 12.0),
                  Text(
                    'Limitation of Liability:',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'We strive to provide accurate and reliable information through our app, but we do not guarantee the accuracy, completeness, or reliability of any content.\n'
                        'We shall not be liable for any direct, indirect, incidental, special, or consequential damages arising out of or in connection with your use of the app.',
                    style: TextStyle(fontSize: 12.0,
                        color: Colors.white),
                  ),
                  SizedBox(height: 12.0),
                  Text(
                    'Modifications:',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'We reserve the right to modify or discontinue the app or any part thereof without prior notice.\n'
                        'We may also update these terms and conditions from time to time, and it is your responsibility to review them periodically.',
                    style: TextStyle(fontSize: 12.0,
                        color: Colors.white),
                  ),
                  SizedBox(height: 12.0),
                  Text(
                    'Governing Law:',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'These terms and conditions shall be governed by and construed in accordance with the laws of India.\n'
                        'Any disputes arising out of or in connection with these terms and conditions shall be subject to the exclusive jurisdiction of the courts in India.',
                    style: TextStyle(fontSize: 12.0,
                        color: Colors.white),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
