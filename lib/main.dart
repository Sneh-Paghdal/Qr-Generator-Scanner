import 'package:flutter/material.dart';
import 'package:qrgenerator/Pages/generator_page.dart';
import 'package:qrgenerator/Pages/history_page.dart';
import 'package:qrgenerator/Pages/scanner_page.dart';
import 'package:qrgenerator/Pages/setting_page.dart';
import 'package:qrgenerator/Test_Pages/dummy_qr_scanner.dart';
import 'package:qrgenerator/Utils/constant.dart';
import 'package:qrgenerator/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QR Generator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/Myhome_page': (context) => MyHomePage(selectedIndex: 0),
        '/scanner_page': (context) => scanner_page(),
        '/history_page': (context) => history_page(),
        '/generator_page': (context) => generator_page(),
        '/setting_page': (context) => setting_page(),
      },
      home: splash_screen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  int selectedIndex = 0;
  MyHomePage({super.key,required this.selectedIndex});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Widget> _widgetOptions = <Widget>[
    scanner_page(),
    // dummy_qr_scanner(),
    history_page(),
    generator_page(),
    setting_page()
  ];

  Future<void> _onItemTapped(int index) async {
    setState(() {
      widget.selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
          height: 60,
          color: constant.screenBackClr,
          child: ClipRRect(
            borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)),
            child: BottomNavigationBar(
              backgroundColor: constant.secondaryBackClr,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.blue,
              unselectedItemColor: constant.unslctdItmClr,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.qr_code_scanner_rounded),
                  label: "Scan",
                ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.history),
                    label: "History",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.add_box_outlined),
                    label: "Generate",
                  ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: "Setting",
                ),
              ],
              currentIndex: widget.selectedIndex,
              onTap: _onItemTapped,
            ),
          ),
        ),
        body: Center(
      child: _widgetOptions.elementAt(widget.selectedIndex),
    ));
  }
}
