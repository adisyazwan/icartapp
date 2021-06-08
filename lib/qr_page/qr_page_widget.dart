import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:icartapp/backend/api_requests/api_calls.dart';
import 'package:icartapp/flutter_flow/flutter_flow_theme.dart';
import 'package:icartapp/flutter_flow/flutter_flow_widgets.dart';

class QrPageWidget extends StatefulWidget {
  QrPageWidget({Key key, this.username}) : super(key: key);
  final String username;

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
          backgroundColor: Color(0xFFFF7043),
          title: Text("Scan using: " + (backCamera ? "Front Cam" : "Back Cam")),
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
          elevation: 4,
        ),
        body: SafeArea(
            child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(color: Color(0xFFEEEEEE)),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      (qrCodeResult == null) || (qrCodeResult == "")
                          ? "Please Scan to show some result"
                          : "Result:" + qrCodeResult,
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w900),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: FFButtonWidget(
                        onPressed: () {
                          updateQRCodeCall(qrCode: qrCodeResult);
                        },
                        text: 'Confirm QR Code',
                        options: FFButtonOptions(
                          width: 130,
                          height: 40,
                          color: FlutterFlowTheme.primaryColor,
                          textStyle: FlutterFlowTheme.subtitle2.override(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                          ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: 12,
                        ),
                      ),
                    )
                  ],
                ))));
  }
}

int camera = 1;
