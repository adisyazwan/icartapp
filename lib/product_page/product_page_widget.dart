import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductPageWidget extends StatefulWidget {
  ProductPageWidget({
    Key key,
    this.id,
  }) : super(key: key);

  final dynamic id;

  @override
  _ProductPageWidgetState createState() => _ProductPageWidgetState();
}

class _ProductPageWidgetState extends State<ProductPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFFFF7043),
        automaticallyImplyLeading: true,
        leading: InkWell(
          onTap: () async {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 24,
          ),
        ),
        title: Text(
          'Product',
          style: FlutterFlowTheme.bodyText2.override(
            fontFamily: 'Montserrat',
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.secondaryColor,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Image.network(
                      getJsonField(widget.id, r'$.imagePath'),
                      width: double.infinity,
                      height: 400,
                      fit: BoxFit.fitWidth,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            getJsonField(widget.id, r'$.name').toString(),
                            style: FlutterFlowTheme.title1.override(
                              fontFamily: 'Playfair Display',
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 6, 0),
                                  child: Text(
                                    'Weight',
                                    style: FlutterFlowTheme.bodyText2.override(
                                      fontFamily: 'Playfair Display',
                                      color: FlutterFlowTheme.tertiaryColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                AutoSizeText(
                                  'RM',
                                  style: FlutterFlowTheme.bodyText2.override(
                                    fontFamily: 'Playfair Display',
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Expanded(
                                  child: AutoSizeText(
                                    getJsonField(widget.id, r'$.price')
                                        .toString(),
                                    style: FlutterFlowTheme.bodyText2.override(
                                      fontFamily: 'Playfair Display',
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Divider(
                                height: 30,
                                thickness: 0.5,
                                color: FlutterFlowTheme.tertiaryColor,
                              ),
                              Text(
                                'Description',
                                style: FlutterFlowTheme.bodyText2.override(
                                  fontFamily: 'Playfair Display',
                                  color: Color(0xFF1E2429),
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
                                child: Text(
                                  getJsonField(widget.id, r'$.description')
                                      .toString(),
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Playfair Display',
                                    fontSize: 16,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Align(
                            alignment: Alignment(0, 0),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 30, 0, 20),
                              child: Text(
                                'A taste for value!',
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Playfair Display',
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 84,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.secondaryColor,
              ),
              child: Align(
                alignment: Alignment(0, 0),
                child: FFButtonWidget(
                  onPressed: () {
                    print('Button pressed ...');
                  },
                  text: 'Add to Grocery List',
                  icon: Icon(
                    Icons.playlist_add,
                    color: Colors.white,
                    size: 15,
                  ),
                  options: FFButtonOptions(
                    width: 200,
                    height: 50,
                    color: FlutterFlowTheme.primaryColor,
                    textStyle: FlutterFlowTheme.subtitle1.override(
                      fontFamily: 'Playfair Display',
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: 6,
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
