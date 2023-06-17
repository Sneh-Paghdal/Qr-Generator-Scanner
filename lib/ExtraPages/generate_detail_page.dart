import 'package:flutter/material.dart';
import 'package:qrgenerator/ExtraPages/qr_genereted_page.dart';
import 'package:qrgenerator/Utils/constant.dart';

class generate_detail_page extends StatefulWidget {
  String widgetIs;
  generate_detail_page({Key? key, required this.widgetIs});

  @override
  State<generate_detail_page> createState() => _generate_detail_pageState();
}

class _generate_detail_pageState extends State<generate_detail_page> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return widget.widgetIs == "Website" ? website("Website") : widget.widgetIs == "Text" ? text("Text") : widget.widgetIs == "Tel" ? Tel("Tel") : widget.widgetIs == "E-mail" ? email('E-mail') : widget.widgetIs == "Facebook" ? Facebook('Facebook') : widget.widgetIs == "Instagram" ? Instagram('Instagram') : widget.widgetIs == "Whatsapp" ? Whatsapp('Whatsapp') : widget.widgetIs == "Youtube" ? Youtube('Youtube') : Twitter('Twitter');
  }

  TextEditingController _controller = TextEditingController();
  Widget website(String widgetIs){
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(color: Colors.white,fontSize: 20),
        backgroundColor:  constant.screenBackClr,
        title: Text(widgetIs),
      ),
      bottomNavigationBar: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder:(context)=>qr_genereted_page(qrString: _controller.text.toString(),qrType: widgetIs,)));
        },
        child: Container(
          color: Colors.blue,
          height: 60,
          child: Center(child: Text("CREATE",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),)),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height,
        color: constant.screenBackClr,
        child: Column(
          children: [
              Container(
                height: 50,
                child:   TextField(
                  keyboardType: TextInputType.url,
                  controller: _controller,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    fillColor:constant.secondaryBackClr,
                    filled: true,
                    isDense: true,
                    contentPadding: EdgeInsets.only(bottom: 10),
                    prefixIcon: Icon(Icons.insert_link_outlined,color: Colors.blue,),
                    suffixIcon: InkWell(onTap: (){
                      _controller.clear();
                    },child: Icon(Icons.close,color: Colors.blue,)) ,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                // width: ,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: (){
                          _controller.text = "https://";


                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: constant.secondaryBackClr
                        ),
                        height: 40,
                        width: 100,
                        child: Center(child: Text("https://",style: TextStyle(color: Colors.white),)),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: (){
                        _controller.text = _controller.text+"www.";
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: constant.secondaryBackClr
                        ),
                        height: 40,
                        width: 100,
                        child: Center(child: Text("www.",style: TextStyle(color: Colors.white),)),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: (){
                        _controller.text = _controller.text+".com";
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: constant.secondaryBackClr
                        ),
                        height: 40,
                        width: 100,
                        child: Center(child: Text(".com",style: TextStyle(color: Colors.white),)),
                      ),
                    )
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }

  Widget text(String widgetIs){
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(color: Colors.white,fontSize: 20),
        backgroundColor:  constant.screenBackClr,
        title: Text(widgetIs),
      ),
      bottomNavigationBar: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder:(context)=>qr_genereted_page(qrString: _controller.text.toString(),qrType: widgetIs,)));
        },
        child: Container(
          color: Colors.blue,
          height: 60,
          child: Center(child: Text("CREATE",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),)),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height,
        color: constant.screenBackClr,
        child: Column(
          children: [
            Container(
              height: 200,
              child:   TextField(
                controller: _controller,
                style: TextStyle(color: Colors.white),
                maxLines: null, // or specify the desired number of lines
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText: 'Enter your text',
                  hintStyle: TextStyle(color: constant.secondaryFontClr),
                  fillColor:constant.secondaryBackClr,
                  filled: true,
                  isDense: true,
                  contentPadding: EdgeInsets.only(bottom: 10),
                  prefixIcon: Icon(Icons.note_alt_sharp,color: Colors.blue,),
                  suffixIcon: InkWell(onTap: (){
                    _controller.clear();
                  },child: Icon(Icons.close,color: Colors.blue,)) ,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget Tel(String widgetIs){
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(color: Colors.white,fontSize: 20),
        backgroundColor:  constant.screenBackClr,
        title: Text(widgetIs),
      ),
      bottomNavigationBar: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder:(context)=>qr_genereted_page(qrString: _controller.text.toString(),qrType: widgetIs,)));
        },
        child: Container(
          color: Colors.blue,
          height: 60,
          child: Center(child: Text("CREATE",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),)),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height,
        color: constant.screenBackClr,
        child: Column(
          children: [
            Container(
              height: 50,
              child:   TextField(
                keyboardType: TextInputType.phone,
                controller: _controller,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  fillColor:constant.secondaryBackClr,
                  hintText: 'Enter Mobile Number',
                  hintStyle: TextStyle(color: constant.secondaryFontClr),
                  filled: true,
                  isDense: true,
                  contentPadding: EdgeInsets.only(bottom: 10),
                  prefixIcon: Icon(Icons.call,color: Colors.blue,),
                  suffixIcon: InkWell(onTap: (){
                    _controller.clear();
                  },child: Icon(Icons.close,color: Colors.blue,)) ,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget email(String widgetIs){
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(color: Colors.white,fontSize: 20),
        backgroundColor:  constant.screenBackClr,
        title: Text(widgetIs),
      ),
      bottomNavigationBar: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder:(context)=>qr_genereted_page(qrString: _controller.text.toString(),qrType: widgetIs,)));
        },
        child: Container(
          color: Colors.blue,
          height: 60,
          child: Center(child: Text("CREATE",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),)),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height,
        color: constant.screenBackClr,
        child: Column(
          children: [
            Container(
              height: 50,
              child:   TextField(
                keyboardType: TextInputType.url,
                controller: _controller,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Enter Mail',
                  hintStyle: TextStyle(color: constant.secondaryFontClr),
                  fillColor:constant.secondaryBackClr,
                  filled: true,
                  isDense: true,
                  contentPadding: EdgeInsets.only(bottom: 10),
                  prefixIcon: Icon(Icons.mail_outline_outlined,color: Colors.blue,),
                  suffixIcon: InkWell(onTap: (){
                    _controller.clear();
                  },child: Icon(Icons.close,color: Colors.blue,)) ,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget Facebook(String widgetIs){
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(color: Colors.white,fontSize: 20),
        backgroundColor:  constant.screenBackClr,
        title: Text(widgetIs),
      ),
      bottomNavigationBar: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder:(context)=>qr_genereted_page(qrString: _controller.text.toString(),qrType: widgetIs,)));
        },
        child: Container(
          color: Colors.blue,
          height: 60,
          child: Center(child: Text("CREATE",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),)),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height,
        color: constant.screenBackClr,
        child: Column(
          children: [
            Container(
              height: 50,
              child:   TextField(
                keyboardType: TextInputType.url,
                controller: _controller,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Enter Facebook Id or Url',
                  hintStyle: TextStyle(color: constant.secondaryFontClr),
                  fillColor:constant.secondaryBackClr,
                  filled: true,
                  isDense: true,
                  contentPadding: EdgeInsets.only(bottom: 10),
                  prefixIcon: Icon(Icons.facebook,color: Colors.blue,),
                  suffixIcon: InkWell(onTap: (){
                    _controller.clear();
                  },child: Icon(Icons.close,color: Colors.blue,)) ,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget Instagram(String widgetIs){
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(color: Colors.white,fontSize: 20),
        backgroundColor:  constant.screenBackClr,
        title: Text(widgetIs),
      ),
      bottomNavigationBar: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder:(context)=>qr_genereted_page(qrString: _controller.text.toString(),qrType: widgetIs,)));
        },
        child: Container(
          color: Colors.blue,
          height: 60,
          child: Center(child: Text("CREATE",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),)),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height,
        color: constant.screenBackClr,
        child: Column(
          children: [
            Container(
              height: 50,
              child:   TextField(
                keyboardType: TextInputType.url,
                controller: _controller,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Enter Instagram Id or Url',
                  hintStyle: TextStyle(color: constant.secondaryFontClr),
                  fillColor:constant.secondaryBackClr,
                  filled: true,
                  isDense: true,
                  contentPadding: EdgeInsets.only(bottom: 10),
                  suffixIcon: InkWell(onTap: (){
                    _controller.clear();
                  },child: Icon(Icons.close,color: Colors.blue,)) ,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget Whatsapp(String widgetIs){
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(color: Colors.white,fontSize: 20),
        backgroundColor:  constant.screenBackClr,
        title: Text(widgetIs),
      ),
      bottomNavigationBar: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder:(context)=>qr_genereted_page(qrString: _controller.text.toString(),qrType: widgetIs,)));
        },
        child: Container(
          color: Colors.blue,
          height: 60,
          child: Center(child: Text("CREATE",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),)),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height,
        color: constant.screenBackClr,
        child: Column(
          children: [
            Container(
              height: 50,
              child:   TextField(
                keyboardType: TextInputType.number,
                controller: _controller,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Enter Whatsapp Number',
                  hintStyle: TextStyle(color: constant.secondaryFontClr),
                  fillColor:constant.secondaryBackClr,
                  filled: true,
                  isDense: true,
                  contentPadding: EdgeInsets.only(bottom: 10),
                  prefixIcon: Icon(Icons.call,color: Colors.blue,),
                  suffixIcon: InkWell(onTap: (){
                    _controller.clear();
                  },child: Icon(Icons.close,color: Colors.blue,)) ,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget Youtube(String widgetIs){
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(color: Colors.white,fontSize: 20),
        backgroundColor:  constant.screenBackClr,
        title: Text(widgetIs),
      ),
      bottomNavigationBar: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder:(context)=>qr_genereted_page(qrString: _controller.text.toString(),qrType: widgetIs,)));
        },
        child: Container(
          color: Colors.blue,
          height: 60,
          child: Center(child: Text("CREATE",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),)),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height,
        color: constant.screenBackClr,
        child: Column(
          children: [
            Container(
              height: 50,
              child:   TextField(
                keyboardType: TextInputType.url,
                controller: _controller,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Enter Youtube Url',
                  hintStyle: TextStyle(color: constant.secondaryFontClr),
                  fillColor:constant.secondaryBackClr,
                  filled: true,
                  isDense: true,
                  contentPadding: EdgeInsets.only(bottom: 10),
                  prefixIcon: Icon(Icons.youtube_searched_for,color: Colors.blue,),
                  suffixIcon: InkWell(onTap: (){
                    _controller.clear();
                  },child: Icon(Icons.close,color: Colors.blue,)) ,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget Twitter(String widgetIs){
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(color: Colors.white,fontSize: 20),
        backgroundColor:  constant.screenBackClr,
        title: Text(widgetIs),
      ),
      bottomNavigationBar: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder:(context)=>qr_genereted_page(qrString: _controller.text.toString(),qrType: widgetIs,)));
        },
        child: Container(
          color: Colors.blue,
          height: 60,
          child: Center(child: Text("CREATE",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),)),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height,
        color: constant.screenBackClr,
        child: Column(
          children: [
            Container(
              height: 50,
              child:   TextField(
                keyboardType: TextInputType.url,
                controller: _controller,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Enter Twitter Url',
                  hintStyle: TextStyle(color: constant.secondaryFontClr),
                  fillColor:constant.secondaryBackClr,
                  filled: true,
                  isDense: true,
                  contentPadding: EdgeInsets.only(bottom: 10),
                  prefixIcon: Icon(Icons.link,color: Colors.blue,),
                  suffixIcon: InkWell(onTap: (){
                    _controller.clear();
                  },child: Icon(Icons.close,color: Colors.blue,)) ,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


