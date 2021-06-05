import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'dart:io' show Platform;

import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QrPageWidget extends StatefulWidget {
  QrPageWidget({Key key}) : super(key: key);

  @override
  _QrPageWidgetState createState() => _QrPageWidgetState();
}

class _QrPageWidgetState extends State<QrPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String qrCodeResult;
  bool backCamera = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Scan using:" + (backCamera ? "Front Cam" : "Back Cam")),
          actions: <Widget>[
            IconButton(
              icon: backCamera
                  ? Icon(Icons.flip_camera_android_rounded)
                  : Icon(Icons.camera_alt_rounded),
              onPressed: () {
                setState(() {
                  backCamera = !backCamera;
                  camera = backCamera ? 1 : -1;
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.qr_code),
              onPressed: () {
                setState(() async {
                  qrCodeResult = await BarcodeScanner.scan();
                });
              },
            )
          ],
        ),
        body: Center(
          child: Text(
            (qrCodeResult == null) || (qrCodeResult == "")
                ? "Please Scan to show some result"
                : "Result:" + qrCodeResult,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w900),
          ),
        ));
  }
}

int camera = 1;
