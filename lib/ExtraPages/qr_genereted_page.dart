import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qrgenerator/ExtraPages/scanned_page.dart';
import 'package:qrgenerator/Utils/constant.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class qr_genereted_page extends StatefulWidget {
  final String qrString;
  final String qrType;
  qr_genereted_page({Key? key, required this.qrString, required this.qrType}) : super(key: key);

  @override
  State<qr_genereted_page> createState() => _qr_genereted_pageState();
}

class _qr_genereted_pageState extends State<qr_genereted_page> {

  bool isLoading = false;

  downloadQr(String url){
      setState(() {
        isLoading = true;
      });
      FileDownloader.downloadFile(url: url,
          onDownloadCompleted: (val){
            print("Downloader");
            setState(() {
              isLoading = false;
            });
            showToast(context, 'Image Downloaded in downloads', true, Colors.black, 100);
          },
          onDownloadError: (e){
            var snackBar = SnackBar(content: Text('Error Occur due to: $e'),backgroundColor: Colors.red,);
            setState(() {
              isLoading = false;
            });
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            print("Failed");
          }
      );
  }

  shareQr(String imageUrl) async {
    setState(() {
      isLoading = true;
    });
    final url = Uri.parse(imageUrl);
    final res = await http.get(url);
    final bytes = res.bodyBytes;
    final temp = await getTemporaryDirectory();
    final path = '${temp.path}/image.jpg';
    print(path);
    File(path).writeAsBytesSync(bytes);
    setState(() {
      isLoading = false;
    });
    Share.shareFiles([path],);
  }

  @override
  void initState() {
    super.initState();
    storeInHistory();
  }

  List<dynamic> historyList = [];

  storeInHistory() async {
    var obj = {
      "type" : widget.qrType,
      "code" : widget.qrString,
      "time" : "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}",
      "clockTime" : DateFormat('hh:mm').format(DateTime.now())
    };
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? historyStr = prefs.getString("generatedHistory") ?? null;
    if(historyStr != null){
      historyList = jsonDecode(historyStr);
      historyList.add(obj);
      String finalHistory = jsonEncode(historyList);
      prefs.setString("generatedHistory", finalHistory);
    }else{
      historyList.add(obj);
      historyStr = jsonEncode(historyList);
      prefs.setString("generatedHistory", historyStr);
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
        title: Text("Generate",style: TextStyle(fontSize: constant.headingTxtSize,color: constant.primaryFontClr,fontWeight: constant.heighlitedFontWeight),),
        centerTitle: true,
      ),
      body: Column(
        children: [
          (isLoading) ?
          Container(
            height: 4,
            child: LinearProgressIndicator(
              backgroundColor: constant.screenBackClr,
              color: Colors.blue,
            ),
          ) : Container(),
          Container(
            height: 275,
            decoration: BoxDecoration(
              color: constant.secondaryBackClr,
              borderRadius: BorderRadius.circular(10)
            ),
            margin: EdgeInsets.all(10),
            width: double.infinity,
            padding: EdgeInsets.only(top: 30,bottom: 30),
            child: Image.network('https://chart.googleapis.com/chart?chs=200x200&cht=qr&chl=${Uri.encodeComponent(widget.qrString)}'),
          ),
          Container(
            width: 200,
            margin: EdgeInsets.only(top: 35),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              onPressed: (){
                downloadQr('https://chart.googleapis.com/chart?chs=200x200&cht=qr&chl=${Uri.encodeComponent("Sneh Paghadal")}');
              },
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: double.infinity,
                child: Text(
                  'Download',
                  style: TextStyle(
                    color: constant.primaryFontClr,
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: 200,
            margin: EdgeInsets.only(top: 35),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              onPressed: (){
                shareQr('https://chart.googleapis.com/chart?chs=200x200&cht=qr&chl=${Uri.encodeComponent("Sneh Paghadal")}');
              },
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: double.infinity,
                child: Text(
                  'Share',
                  style: TextStyle(
                    color: constant.primaryFontClr,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
