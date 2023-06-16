import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qrgenerator/ExtraPages/scanned_page.dart';
import 'package:qrgenerator/Utils/constant.dart';

class scanner_page extends StatefulWidget {
  const scanner_page({Key? key}) : super(key: key);

  @override
  State<scanner_page> createState() => _scanner_pageState();
}

class _scanner_pageState extends State<scanner_page> {

  bool isPermissionGranted = true;

  //==============================QR Scanner==============================

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  @override
  void reassemble() {
    super.reassemble();
      controller!.pauseCamera();
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        controller?.pauseCamera();
        if(result != null){
          String code = result!.code ?? 'Data not found';
          Navigator.push(context, MaterialPageRoute(builder: (context) => scanned_page(qrString: code, qrType: describeEnum(result!.format))));
        }
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    if (!p) {
      setState(() {
        isPermissionGranted = false;
      });
    }
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 350 ||
        MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.blue,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  //======================================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constant.screenBackClr,
      floatingActionButton: Container(
        color: Colors.transparent,
        height: MediaQuery.of(context).size.height / 2 - 250,
        width: 230,
        alignment: Alignment.topCenter,
        child: Container(
          height: 60,
          padding: EdgeInsets.only(top: 9),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.4),
            borderRadius: BorderRadius.circular(30)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () async {
                  await controller?.toggleFlash();
                  setState(() {});
                },
                child: Column(
                  children: [
                    Icon(Icons.flashlight_on,color: Colors.white,),
                    Text("Flash",style: TextStyle(color: Colors.white,fontSize: 12),)
                  ],
                ),
              ),
              InkWell(
                onTap: () async {
                  await controller?.resumeCamera();
                },
                child: Column(
                  children: [
                    Icon(Icons.play_circle,color: Colors.white,),
                    Text("Resume",style: TextStyle(color: Colors.white,fontSize: 12),)
                  ],
                ),
              ),
              InkWell(
                onTap: () async {
                  await controller?.pauseCamera();
                },
                child: Column(
                  children: [
                    Icon(Icons.pause_circle_filled_sharp,color: Colors.white,),
                    Text("Pause",style: TextStyle(color: Colors.white,fontSize: 12),)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      body: (isPermissionGranted)
          ?
      Column(
        children: <Widget>[
          Expanded(child: _buildQrView(context)),
        ],
      )
          :
      notPermittedWidget(),
    );
  }

  Widget notPermittedWidget(){
    return Center(
      child: Container(
        height: 280,
        child: Column(
          children: [
            Text("Permission Required",style: TextStyle(color: constant.primaryFontClr,fontWeight: constant.heighlitedFontWeight,fontSize: constant.headingTxtSize),),
            Container(height: 20,),
            Container(margin: EdgeInsets.only(left: 30,right: 30),child: Text("Camera Permission is required to scan QR codes/barcodes",style: TextStyle(color: constant.secondaryFontClr),textAlign: TextAlign.center,)),
            Container(height: 20,),
            Text("1.Open Settings",style: TextStyle(color: constant.secondaryFontClr),textAlign: TextAlign.center,),
            Text("2.Tap Permissions",style: TextStyle(color: constant.secondaryFontClr),textAlign: TextAlign.center,),
            Text("1.Open Settings",style: TextStyle(color: constant.secondaryFontClr),textAlign: TextAlign.center,),
            Container(
              margin: EdgeInsets.only(left: 40,right: 40,top: 35),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                onPressed: () {
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: double.infinity,
                  child: Text(
                    'Open Settings',
                    style: TextStyle(
                      color: constant.primaryFontClr,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}
