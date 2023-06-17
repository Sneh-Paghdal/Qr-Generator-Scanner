import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:qrgenerator/ExtraPages/scanned_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Pages/history_page.dart';
import 'package:qrgenerator/Utils/constant.dart';

class generated_qr_history_page extends StatefulWidget {
  const generated_qr_history_page({Key? key}) : super(key: key);

  @override
  State<generated_qr_history_page> createState() => _generated_qr_history_pageState();
}

class _generated_qr_history_pageState extends State<generated_qr_history_page> {
  List<MyObject> historyList = [];

  @override
  void initState() {
    super.initState();
    fetchHistoryList();
  }

  Future<void> fetchHistoryList() async {
    final prefs = await SharedPreferences.getInstance();
    final historyListJson = prefs.getString('generatedHistory');

    if (historyListJson != null) {
      final List<dynamic> decodedList = jsonDecode(historyListJson);
      setState(() {
        historyList = decodedList.map((item) => MyObject(
            type: item['type'],
            code: item['code'],
            time: item['time'],
            clockTime : item['clockTime']
        )).toList();
      });
    }
  }

  Map<String, List<MyObject>> groupObjectsByDate(List<MyObject> objects) {
    Map<String, List<MyObject>> groupedObjects = {};

    for (var obj in objects) {
      if (groupedObjects.containsKey(obj.time)) {
        groupedObjects[obj.time]!.add(obj);
      } else {
        groupedObjects[obj.time] = [obj];
      }
    }

    return groupedObjects;
  }

  @override
  Widget build(BuildContext context) {
    // Group the sorted list based on time
    final groupedObjects = groupObjectsByDate(historyList);

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
        title: Text("History",style: TextStyle(fontSize: constant.headingTxtSize,color: constant.primaryFontClr,fontWeight: constant.heighlitedFontWeight),),
      ),
      body: (historyList.length == 0) ? Center(
        child: Container(
          height: 100,
          child: Column(
            children: [
              Icon(Icons.hourglass_empty_outlined,color: constant.secondaryFontClr,size: 55,),
              SizedBox(height: 10,),
              Text("No History",style: TextStyle(color: constant.secondaryFontClr),)
            ],
          ),
        ),
      ) :
      ListView.builder(
        itemCount: groupedObjects.length,
        itemBuilder: (context, index) {
          final time = groupedObjects.keys.toList()[index];
          final objectsForTime = groupedObjects[time];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10,left: 10),
                child: Text(
                  time, // Display the time
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: constant.secondaryFontClr),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: objectsForTime!.length,
                itemBuilder: (context, innerIndex) {
                  final obj = objectsForTime[innerIndex];
                  return Container(
                    // height: 60,
                    margin: EdgeInsets.only(top: 5,bottom: 5,left: 10,right: 10),
                    padding: EdgeInsets.only(top: 10,bottom: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: constant.secondaryBackClr
                    ),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => scanned_page(qrString: obj.code, isScannerPage: false)));
                      },
                      child: Row(
                        children: [
                          SizedBox(width: 10,),
                          (obj.type == "Website") ?
                          Container(
                            height: 30,width: 30,
                            child: Image.network("https://img.icons8.com/ios/50/domain--v1.png",color: Colors.blue),
                          ) : (obj.type == "Text") ?
                          Container(
                            height: 30,width: 30,
                            child: Image.network("https://img.icons8.com/ios/50/text.png",color: Colors.blue),
                          ) : (obj.type == "Tel") ?
                          Container(
                            height: 30,width: 30,
                            child: Image.network("https://img.icons8.com/ios/50/apple-mail.png",color: Colors.blue),
                          )  : (obj.type == "E-mail") ?
                          Container(
                            height: 30,width: 30,
                            child: Image.network("https://img.icons8.com/ios/50/instagram-new--v1.png",color: Colors.blue),
                          ): (obj.type == "Instagram") ?
                          Container(
                            height: 30,width: 30,
                            child: Image.network("https://img.icons8.com/ios/50/facebook-new.png",color: Colors.blue),
                          ): (obj.type == "Facebook") ?
                          Container(
                            height: 30,width: 30,
                            child: Image.network("https://img.icons8.com/ios/50/youtube-play--v1.png",color: Colors.blue),
                          ) : (obj.type == "Youtube") ?
                          Container(
                            height: 30,width: 30,
                            child: Image.network("https://img.icons8.com/ios/50/whatsapp--v1.png",color: Colors.blue),
                          ) : (obj.type == "Whatsapp") ?
                          Container(
                            height: 30,width: 30,
                            child: Image.network("https://img.icons8.com/ios/50/twitter--v1.png",color: Colors.blue),
                          )  : Container(
                            child: Icon(
                              Icons.note_alt_sharp,
                              color: Colors.blue,
                            ),
                          ),
                          SizedBox(width: 10,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  width: MediaQuery.of(context).size.width - 80,
                                  child: Text("${obj.code}",style: TextStyle(color: constant.primaryFontClr,fontWeight: constant.heighlitedFontWeight,overflow: TextOverflow.ellipsis),)
                              ),
                              SizedBox(height: 3,),
                              Container(
                                width: MediaQuery.of(context).size.width - 80,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("${obj.type}",style: TextStyle(color: constant.secondaryFontClr,fontSize: 13),),
                                    Text("${obj.clockTime}",style: TextStyle(color: constant.secondaryFontClr,fontSize: 12),),
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
