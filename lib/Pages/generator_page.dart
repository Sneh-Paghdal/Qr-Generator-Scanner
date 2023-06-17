import 'package:flutter/material.dart';
import 'package:qrgenerator/ExtraPages/generate_detail_page.dart';
import 'package:qrgenerator/ExtraPages/generated_qr_history_page.dart';
import 'package:qrgenerator/ExtraPages/qr_genereted_page.dart';
import 'package:qrgenerator/Utils/constant.dart';
import 'package:qrgenerator/main.dart';

class generator_page extends StatefulWidget {
  const generator_page({Key? key}) : super(key: key);

  @override
  State<generator_page> createState() => _generator_pageState();
}

class _generator_pageState extends State<generator_page> {

  List qrFeature = [
    {
      "icon": "https://img.icons8.com/ios/50/domain--v1.png",
      "name":"Website"
    },
    {
      "icon": "https://img.icons8.com/ios/50/text.png" ,
      "name":"Text"
    },
    {
      "icon": "https://img.icons8.com/ios/50/phone-disconnected.png",
      "name":"Tel"
    },
    {
      "icon": "https://img.icons8.com/ios/50/apple-mail.png",
      "name":"E-mail"
    },
    {
      "icon": "https://img.icons8.com/ios/50/facebook-new.png" ,
      "name":"Facebook"
    },
    {
      "icon": "https://img.icons8.com/ios/50/instagram-new--v1.png",
      "name":"Instagram"
    },
    {
      "icon":"https://img.icons8.com/ios/50/whatsapp--v1.png" ,
      "name":"Whatsapp"
    },
    {
      "icon": "https://img.icons8.com/ios/50/youtube-play--v1.png",
      "name":"Youtube"
    },
    {
      "icon": "https://img.icons8.com/ios/50/twitter--v1.png",
      "name":"Twitter"
    }
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constant.screenBackClr,
      appBar: AppBar(
        backgroundColor: constant.screenBackClr,
        title: Text("Generate",style: TextStyle(fontSize: constant.headingTxtSize,color: constant.primaryFontClr,fontWeight: constant.heighlitedFontWeight),),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              height: 60,
              decoration: BoxDecoration(
                color: constant.secondaryBackClr,
                borderRadius: BorderRadius.circular(10)
              ),
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => generated_qr_history_page()));
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

            SizedBox(
              height: 20,
            ),
        Expanded(
          child: GridView.builder(
              itemBuilder: (context,index){
                return InkWell(
                  onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => generate_detail_page(
                                    widgetIs: qrFeature[index]['name'])));
                      },
                  child: Container(
                    decoration: BoxDecoration(
                        color: constant.secondaryBackClr,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       Image.network(qrFeature[index]['icon'] ,color: Colors.blue,width: 30,height: 30,),
                        SizedBox(
                          height: 10,
                        ),
                        Text(qrFeature[index]['name'],style: TextStyle(color: Colors.white),)
                      ],
                    ),

                  ),
                );
              },
              itemCount: qrFeature.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisExtent: 100,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20
              )
          ),
        )
          ],
        ),
      ),
    );
  }
}
