import 'package:flutter/material.dart';

class scanned_page extends StatefulWidget {
  final String qrString;
  final String qrType;
  const scanned_page({Key? key, required this.qrString, required this.qrType}) : super(key: key);

  @override
  State<scanned_page> createState() => _scanned_pageState();
}

class _scanned_pageState extends State<scanned_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
