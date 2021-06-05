import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QrPageWidget extends StatefulWidget {
  QrPageWidget({Key key}) : super(key: key);

  @override
  _QrPageWidgetState createState() => _QrPageWidgetState();
}

class _QrPageWidgetState extends State<QrPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
    );
  }
}
