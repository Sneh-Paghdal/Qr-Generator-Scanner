import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:qrgenerator/Utils/constant.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;


class scanned_page extends StatefulWidget {
  final String qrString;
  final bool isScannerPage;
  const scanned_page({Key? key, required this.qrString, required this.isScannerPage,})
      : super(key: key);

  @override
  State<scanned_page> createState() => _scanned_pageState();
}

class _scanned_pageState extends State<scanned_page> {

  bool isIntenetOn = false;

  @override
  void initState() {
    super.initState();
    internetChecker();
    if(widget.isScannerPage){
      storeInHistory();
      autoCopySetting();
    }
    // getQrCode();
  }

  internetChecker() async {
    isIntenetOn = await checkInternetConnection();
    setState(() {
    });
    if(!isIntenetOn){
      showToast(context, "You Are Offline!", true, Colors.red, 100);
    }
  }

  bool isWebsite(String string) {
    RegExp regex = RegExp(
        r"^(http[s]?:\/\/)?([a-zA-Z0-9]+([\-\.]{1}[a-zA-Z0-9]+)*\.[a-zA-Z]{2,63}(:[0-9]{1,5})?(\/.*)?)$");
    return regex.hasMatch(string);
  }

  bool isMobileNumber(String number) {
    RegExp regex = RegExp(r'^(\+\d{1,3}\s?)?(\d{7,15})$');
    return regex.hasMatch(number);
  }

  _send(String form) async {
    if(form == "SMS"){
      final Uri smsLaunchUri = Uri(
        scheme: 'sms',
        path: '',
        queryParameters: <String, String>{
          'body': Uri.decodeComponent('${widget.qrString} \n \n \n Scanned By https://play.google.com/store/apps/details?id=qrcodescanner.barcodescanner.qrscanner.qrcodereader.qrgenerator.jasnehstudio'),
        },
      );
      if (await launchUrl(smsLaunchUri)) {
        //email app opened
      }else{
        //email app is not opened
      }
    }else if(form == "EMAIL"){
      String? encodeQueryParameters(Map<String, String> params) {
        return params.entries
            .map((MapEntry<String, String> e) =>
        '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
            .join('&');
      }
      final Uri emailLaunchUri = Uri(
        scheme: 'mailto',
        path: '@example.com',
        query: encodeQueryParameters(<String, String>{
          'subject': '',
          'body' : '${widget.qrString} \n \n Scanned By https://play.google.com/store/apps/details?id=qrcodescanner.barcodescanner.qrscanner.qrcodereader.qrgenerator.jasnehstudio'
        }),
      );
      if (await launchUrl(emailLaunchUri)) {
        //email app opened
      }else{
        //email app is not opened
      }
    }else if(form == "SEARCH"){
      bool isNetOn = await checkInternetConnection();
      if(isNetOn == true) {
        if (!await launchUrl(
          Uri.parse("${widget.qrString}"),
          mode: LaunchMode.externalApplication,
        )) {
          throw Exception('Could not launch url');
        }
      } else{
        showToast(context, "You Are Offline!", true, Colors.red, 100);
      }
      }else if(form == "COPY"){
        try {
          await Clipboard.setData(
              ClipboardData(
                  text: widget
                      .qrString));
          showToast(
              context, "Link Copied!",
              true, Colors.black,
              100);
        } catch (e) {
          print(e);
          showToast(
              context, "${e}",
              false, Colors.black,
              100);
        }
    }else if(form == "SHARE"){
      Share.share(widget.qrString);
    }else if(form == "CALL"){
      final Uri smsLaunchUri = Uri(
        scheme: 'tel',
        path: '${widget.qrString}',
      );
      if (await launchUrl(smsLaunchUri)) {
        //email app opened
      }else{
        //email app is not opened
      }
    }
  }

  autoCopySetting() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isCopyOn = prefs.getBool('isCopy') ?? false;
    if(isCopyOn){
      try {
        await Clipboard.setData(
            ClipboardData(
                text: widget
                    .qrString));
        showToast(
            context, "Copied to clipboard!",
            true, Colors.black,
            100);
      } catch (e) {
        print(e);
        showToast(
            context, "${e}",
            false, Colors.black,
            100);
      }
    }
  }

  List<dynamic> historyList = [];

  storeInHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isHistoryOn = prefs.getBool("isHistory") ?? true;
    if(isHistoryOn){
      var obj = {
        "type" : (isWebsite(widget.qrString)) ? "URL" : (isMobileNumber(widget.qrString)) ? "Mobile No." : "Text",
        "code" : widget.qrString,
        "time" : "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}",
        "clockTime" : DateFormat('hh:mm').format(DateTime.now())
      };
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? historyStr = prefs.getString("history") ?? null;
      if(historyStr != null){
        historyList = jsonDecode(historyStr);
        historyList.add(obj);
        String finalHistory = jsonEncode(historyList);
        prefs.setString("history", finalHistory);
      }else{
        historyList.add(obj);
        historyStr = jsonEncode(historyList);
        prefs.setString("history", historyStr);
      }
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
        title: (isWebsite(widget.qrString))
            ? Container(
                width: 100,
                child: Row(
                  children: [
                    Icon(
                      Icons.link_outlined,
                      color: Colors.white,
                    ),
                    Text(
                      "  URL",
                      style: TextStyle(
                          color: constant.primaryFontClr,
                          fontWeight: constant.heighlitedFontWeight),
                    )
                  ],
                ),
              )
            : (isMobileNumber(widget.qrString)
                ? Container(
                    width: 170,
                    child: Row(
                      children: [
                        Icon(
                          Icons.phone,
                          color: Colors.white,
                        ),
                        Text(
                          "  Mobile No.",
                          style: TextStyle(
                              color: constant.primaryFontClr,
                              fontWeight: constant.heighlitedFontWeight),
                        )
                      ],
                    ),
                  )
                : Container(
                    width: 100,
                    child: Row(
                      children: [
                        Icon(
                          Icons.note_alt_sharp,
                          color: Colors.white,
                        ),
                        Text(
                          "  Text",
                          style: TextStyle(
                              color: constant.primaryFontClr,
                              fontWeight: constant.heighlitedFontWeight),
                        )
                      ],
                    ),
                  )),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            decoration: BoxDecoration(
              color: constant.secondaryBackClr,
              borderRadius: BorderRadius.circular(10)
            ),
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.only(top: 15,bottom: 15),
            child: Text(
              widget.qrString,
              style: TextStyle(fontSize: 15,color: Colors.white),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Wrap(
              spacing: 8,
              runSpacing: 10,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    elevation: 0,
                    shadowColor: Colors.transparent,
                  ),
                  onPressed: () {
                    _send("SEARCH");
                  },
                  child: Container(
                    height: 70,
                    width: 55,
                    child: Column(
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        Text(
                          "Search",
                          style: TextStyle(
                            color: constant.secondaryFontClr,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    elevation: 0,
                    shadowColor: Colors.transparent,
                  ),
                  onPressed: () {
                    _send("SMS");
                  },
                  child: Container(
                    height: 70,
                    width: 55,
                    child: Column(
                      children: [
                        Icon(
                          Icons.sms_outlined,
                          color: Colors.white,
                        ),
                        Text(
                          "SMS",
                          style: TextStyle(
                            color: constant.secondaryFontClr,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    elevation: 0,
                    shadowColor: Colors.transparent,
                  ),
                  onPressed: () {
                    _send("EMAIL");
                  },
                  child: Container(
                    height: 70,
                    width: 55,
                    child: Column(
                      children: [
                        Icon(
                          Icons.email_outlined,
                          color: Colors.white,
                        ),
                        Text(
                          "Email",
                          style: TextStyle(
                            color: constant.secondaryFontClr,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    elevation: 0,
                    shadowColor: Colors.transparent,
                  ),
                  onPressed: () {
                    _send("COPY");
                  },
                  child: Container(
                    height: 70,
                    width: 55,
                    child: Column(
                      children: [
                        Icon(
                          Icons.copy_rounded,
                          color: Colors.white,
                        ),
                        Text(
                          "Copy",
                          style: TextStyle(
                            color: constant.secondaryFontClr,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    elevation: 0,
                    shadowColor: Colors.transparent,
                  ),
                  onPressed: () {
                    _send("SHARE");
                  },
                  child: Container(
                    height: 70,
                    width: 55,
                    child: Column(
                      children: [
                        Icon(
                          Icons.share_outlined,
                          color: Colors.white,
                        ),
                        Text(
                          "Share",
                          style: TextStyle(
                            color: constant.secondaryFontClr,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                (isMobileNumber(widget.qrString)) ?
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    elevation: 0,
                    shadowColor: Colors.transparent,
                  ),
                  onPressed: () {
                    _send("CALL");
                  },
                  child: Container(
                    height: 70,
                    width: 55,
                    child: Column(
                      children: [
                        Icon(
                          Icons.call_outlined,
                          color: Colors.white,
                        ),
                        Text(
                          "Call",
                          style: TextStyle(
                            color: constant.secondaryFontClr,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                ) : Container(),
              ],
            ),
          ),
          (isIntenetOn) ?
          Container(
            margin: EdgeInsets.only(top: 30),
            child: Image.network('https://chart.googleapis.com/chart?chs=200x200&cht=qr&chl=${Uri.encodeComponent(widget.qrString)}'),
          ) : Container(),
        ],
      ),
    );
  }
}

void showToast(BuildContext context,message,bool isBottomsheet,Color color,int height) {

  ScaffoldMessenger.of(context).showSnackBar(

    SnackBar(
      duration: Duration(seconds: 1),
      // margin: EdgeInsets.only(top: 100),
      margin: EdgeInsets.only(bottom: isBottomsheet == false ? MediaQuery.of(context).size.height-height : 20,left: 10,right: 10),
      backgroundColor: color,
      content: Text(message,style: TextStyle(color: Colors.white),),
      behavior: SnackBarBehavior.floating,
    ),
  );
}

Future<bool> checkInternetConnection() async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }
    else {
      return false;
    }
  } on SocketException catch (_) {
    return false;
  }
}