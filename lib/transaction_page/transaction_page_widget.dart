import 'package:icartapp/auth/auth_util.dart';
import 'package:icartapp/login_page/login_page_widget.dart';
import 'package:icartapp/transaction_page/payment_stripe.dart';

import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../main.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class TransactionPageWidget extends StatefulWidget {
  TransactionPageWidget({
    Key key,
    this.username,
  }) : super(key: key);

  final String username;

  @override
  _TransactionPageWidgetState createState() => _TransactionPageWidgetState();
}

class _TransactionPageWidgetState extends State<TransactionPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  double totalPrice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFFFF5722),
        iconTheme: IconThemeData(color: Colors.white),
        automaticallyImplyLeading: true,
        title: Text(
          'Transactions',
          style: FlutterFlowTheme.title1.override(
            fontFamily: 'Playfair Display',
            color: FlutterFlowTheme.secondaryColor,
          ),
        ),
        actions: [
          Align(
            alignment: Alignment(0, 0),
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: InkWell(
                onTap: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            StripePayment(totalPrice: totalPrice)),
                  );
                },
                child: FaIcon(
                  FontAwesomeIcons.dolly,
                  color: FlutterFlowTheme.secondaryColor,
                  size: 24,
                ),
              ),
            ),
          )
        ],
        centerTitle: true,
        elevation: 4,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          setState(() {
            getUserCartCall(
              name: widget.username,
            );
            getUserTotalCall(
              username: widget.username,
            );
          });
        },
        backgroundColor: Color(0xFFFF7043),
        elevation: 8,
        icon: Icon(Icons.refresh),
        label: Text(
          'Refresh',
          style: FlutterFlowTheme.bodyText1.override(
              fontFamily: 'Poppins', color: Colors.white, fontSize: 13),
        ),
      ),
      backgroundColor: Color(0xFFDBE2E7),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FutureBuilder<dynamic>(
                    future: getUserTotalCall(
                      username: widget.username,
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(child: CircularProgressIndicator());
                      }
                      final rowGetUserTotalResponse = snapshot.data;
                      totalPrice = getJsonField(
                          rowGetUserTotalResponse, r'$.totalPrice');
                      return Padding(
                        padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(4, 4, 0, 4),
                                child: Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: Color(0xFFF5F5F5),
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: InkWell(
                                    onTap: () async {
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => NavBarPage(
                                              initialPage: 'HomePage'),
                                        ),
                                      );
                                    },
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(8, 8, 8, 8),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  'Total weight',
                                                  style: FlutterFlowTheme
                                                      .bodyText2
                                                      .override(
                                                    fontFamily:
                                                        'Playfair Display',
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  8, 0, 0, 8),
                                              child: Text(
                                                getJsonField(
                                                            rowGetUserTotalResponse,
                                                            r'$.totalWeight')
                                                        .toString() +
                                                    ' kg',
                                                style: FlutterFlowTheme.title2
                                                    .override(
                                                  fontFamily: 'Poppins',
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                                child: Align(
                                                    alignment: Alignment(1, 0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              8, 0, 20, 8),
                                                      child: Text(
                                                        '??0.333%',
                                                        style: FlutterFlowTheme
                                                            .title2
                                                            .override(
                                                          fontFamily: 'Poppins',
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    )))
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(2, 4, 4, 4),
                                child: Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: Color(0xFFF5F5F5),
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: InkWell(
                                    onTap: () async {
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => NavBarPage(
                                              initialPage: 'HomePage'),
                                        ),
                                      );
                                    },
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(8, 8, 8, 8),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  'Pay total price',
                                                  style: FlutterFlowTheme
                                                      .bodyText2
                                                      .override(
                                                    fontFamily:
                                                        'Playfair Display',
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  8, 0, 0, 8),
                                              child: Text(
                                                'RM' +
                                                    getJsonField(
                                                            rowGetUserTotalResponse,
                                                            r'$.totalPrice')
                                                        .toString(),
                                                style: FlutterFlowTheme.title2
                                                    .override(
                                                  fontFamily: 'Poppins',
                                                  color: Color(0xFF3BC821),
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(16, 8, 0, 12),
                        child: Text(
                          'List of Added Products',
                          style: FlutterFlowTheme.bodyText2.override(
                            fontFamily: 'Playfair Display',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      /*Expanded(
                        child: Align(
                          alignment: Alignment(1, 1),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
                            child: InkWell(
                              onTap: () async {
                                getUserCartCall(
                                  name: widget.username,
                                );
                                ;
                              },
                              child: Icon(
                                Icons.refresh,
                                color: Colors.black,
                                size: 24,
                              ),
                            ),
                          ),
                        ),
                      )*/
                    ],
                  ),
                  FutureBuilder<dynamic>(
                    future: getUserInfoCall(
                      name: widget.username,
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(child: CircularProgressIndicator());
                      }
                      final listViewGetUserInfoResponse = snapshot.data;
                      return Builder(
                        builder: (context) {
                          final products = (getJsonField(
                                      listViewGetUserInfoResponse,
                                      r'$.cart_products') ??
                                  [])
                              .take(30)
                              .toList();
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: products.length,
                            itemBuilder: (context, productsIndex) {
                              final productsItem = products[productsIndex];
                              return Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: Color(0xFFF5F5F5),
                                elevation: 0,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 2),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  10, 5, 0, 5),
                                              child: Text(
                                                getJsonField(
                                                        productsItem, r'$.name')
                                                    .toString(),
                                                style: FlutterFlowTheme
                                                    .subtitle2
                                                    .override(
                                                  fontFamily: 'Poppins',
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment(1, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                getJsonField(productsItem,
                                                            r'$.weight')
                                                        .toString() +
                                                    'kg',
                                                style: FlutterFlowTheme
                                                    .subtitle2
                                                    .override(
                                                  fontFamily: 'Poppins',
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment(1, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    0, 0, 10, 0),
                                                child: Text(
                                                  'RM' +
                                                      getJsonField(productsItem,
                                                              r'$.price')
                                                          .toString(),
                                                  style: FlutterFlowTheme
                                                      .subtitle2
                                                      .override(
                                                    fontFamily: 'Poppins',
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
