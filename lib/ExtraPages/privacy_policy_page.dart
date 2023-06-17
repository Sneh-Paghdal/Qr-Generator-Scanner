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
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: constant.secondaryBackClr
              ),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome to Jasneh! This Privacy Policy explains how we collect, use, and safeguard your personal information when you use our QR code scanning and QR code generator app. Please read this Privacy Policy carefully to understand our practices regarding your personal data.',
                    style: TextStyle(fontSize: 13.0,
                        color: Colors.white),
                  ),
                  SizedBox(height: 12.0),
                  Text(
                    'Information We Collect:',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'When you use our app, we may collect certain personal information, such as your name, email address, and device information.\n'
                        'We also collect information related to your use of the app, including QR codes scanned or generated, timestamps, and app settings.\n'
                        'We may collect non-personal information such as aggregated data or statistical information about app usage patterns.',
                    style: TextStyle(fontSize: 12.0,
                        color: Colors.white),
                  ),
                  SizedBox(height: 12.0),
                  Text(
                    'How We Use Your Information:',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'We use the collected information to provide, improve, and personalize the app experience for you.\n'
                        'We may use your email address to send you important updates or notifications related to the app.\n'
                        'We may use aggregated and statistical data for analytical purposes to understand app usage patterns and improve our services.',
                    style: TextStyle(fontSize: 12.0,
                        color: Colors.white),
                  ),
                  SizedBox(height: 12.0),
                  Text(
                    'Data Sharing and Disclosure:',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'We do not sell, rent, or lease your personal information to third parties.\n'
                        'We may share your information with trusted third-party service providers who assist us in operating and maintaining the app.\n'
                        'We may disclose your information if required by law or to protect our rights, property, or safety.',
                    style: TextStyle(fontSize: 12.0,
                        color: Colors.white),
                  ),
                  SizedBox(height: 12.0),
                  Text(
                    'Security:',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'We take reasonable measures to protect your personal information from unauthorized access, use, or disclosure.\n'
                        'However, please note that no method of transmission over the internet or electronic storage is 100% secure.',
                    style: TextStyle(fontSize: 12.0,
                        color: Colors.white),
                  ),
                  SizedBox(height: 12.0),
                  Text(
                    'Your Choices:',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'You can choose not to provide certain personal information, but it may limit your ability to use certain features of the app.\n'
                        'You may opt out of receiving promotional emails from us by following the instructions provided in those emails.',
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
