import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:qrgenerator/Utils/constant.dart';

class about_us extends StatefulWidget {
  const about_us({Key? key}) : super(key: key);

  @override
  State<about_us> createState() => _about_usState();
}

class _about_usState extends State<about_us> {

  _openPlayStoreLink() async {
    const url = 'https://play.google.com/store/apps/developer?id=Jasneh Studio'; // Replace with your Play Store developer URL
    if (await canLaunch(url)) {
    await launch(url);
    } else {
    throw 'Could not launch $url';
    }
  }

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
        title: Text("About Us",style: TextStyle(fontSize: constant.headingTxtSize,color: constant.primaryFontClr,fontWeight: constant.heighlitedFontWeight),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: constant.secondaryBackClr,
            borderRadius: BorderRadius.circular(10)
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // SizedBox(height: 20),
                // CircleAvatar(
                //   radius: 60,
                //   backgroundImage: AssetImage('assets/logo.png'),
                // ),
                // SizedBox(height: 20),
                Text(
                  'Jasneh Studio',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Publishers of Innovative Apps',
                  style: TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                      color: Colors.white
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text(
                  'Welcome to Jasneh Studio, a dynamic app development company dedicated to bringing you cutting-edge solutions. With a focus on creating powerful QR code scanning and generation applications, we strive to make your mobile experience seamless and efficient.',
                  style: TextStyle(
                    fontSize: 16,
                      color: Colors.white
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 20),
                Text(
                  'At Jasneh Studio, we believe in leveraging the latest technologies to deliver innovative apps that cater to your needs. With a diverse portfolio of applications, we continuously explore new possibilities and develop user-friendly solutions for various industries.',
                  style: TextStyle(
                    fontSize: 16,
                      color: Colors.white
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 20),
                Text(
                  'Check out our published apps on the Google Play Store:',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _openPlayStoreLink,
                  child: Text(
                    'View Apps',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
