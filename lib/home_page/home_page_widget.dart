import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import '../login_page/login_page_widget.dart';
import '../search_results_page/search_results_page_widget.dart';
import '../transaction_page/transaction_page_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageWidget extends StatefulWidget {
  HomePageWidget({
    Key key,
    this.username,
  }) : super(key: key);

  final String username;

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  String uploadedFileUrl;
  TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.secondaryColor,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await signOut();
          await Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => LoginPageWidget(),
            ),
            (r) => false,
          );
        },
        backgroundColor: FlutterFlowTheme.primaryColor,
        elevation: 8,
        label: Text(
          'Logout',
          style: FlutterFlowTheme.bodyText1.override(
            fontFamily: 'Playfair Display',
            color: Colors.white,
          ),
        ),
      ),
      body: StreamBuilder<UsersRecord>(
        stream: UsersRecord.getDocument(currentUserReference),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          final columnUsersRecord = snapshot.data;
          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Stack(
                  children: [
                    Align(
                      alignment: Alignment(0, 0),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 60, 20, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            FutureBuilder<dynamic>(
                              future: getUserInfoCall(
                                name: columnUsersRecord.displayName,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                      child: CircularProgressIndicator());
                                }
                                final containerGetUserInfoResponse =
                                    snapshot.data;
                                return Container(
                                  width: double.infinity,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFF7043),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(0, 1, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(40, 0, 0, 0),
                                          child: Text(
                                            getJsonField(
                                                    containerGetUserInfoResponse,
                                                    r'$.nickname')
                                                .toString(),
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.title1
                                                .override(
                                              fontFamily: 'Playfair Display',
                                              color: Colors.white,
                                              fontSize: 30,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Align(
                                            alignment: Alignment(0.6, 0),
                                            child: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  5, 0, 1, 0),
                                              child: InkWell(
                                                onTap: () async {
                                                  final selectedMedia =
                                                      await selectMedia(
                                                    maxWidth: 200.00,
                                                    maxHeight: 200.00,
                                                  );
                                                  if (selectedMedia != null &&
                                                      validateFileFormat(
                                                          selectedMedia
                                                              .storagePath,
                                                          context)) {
                                                    showUploadMessage(context,
                                                        'Uploading file...',
                                                        showLoading: true);
                                                    final downloadUrl =
                                                        await uploadData(
                                                            selectedMedia
                                                                .storagePath,
                                                            selectedMedia
                                                                .bytes);
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .hideCurrentSnackBar();
                                                    if (downloadUrl != null) {
                                                      setState(() =>
                                                          uploadedFileUrl =
                                                              downloadUrl);
                                                      showUploadMessage(
                                                          context, 'Success!');
                                                    } else {
                                                      showUploadMessage(context,
                                                          'Failed to upload media');
                                                    }
                                                  }
                                                },
                                                child: Container(
                                                  width: 60,
                                                  height: 60,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: CachedNetworkImage(
                                                    imageUrl: getJsonField(
                                                        containerGetUserInfoResponse,
                                                        r'$.photo_url'),
                                                    fit: BoxFit.scaleDown,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 27, 0, 0),
                              child: Container(
                                width: double.infinity,
                                height: 52,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  SearchResultsPageWidget(
                                                searchTerm: textController.text,
                                              ),
                                            ),
                                          );
                                        },
                                        child: Icon(
                                          Icons.search,
                                          color: FlutterFlowTheme.tertiaryColor,
                                          size: 24,
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(5, 0, 0, 2),
                                          child: TextFormField(
                                            controller: textController,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              hintText: 'Search items...',
                                              hintStyle: FlutterFlowTheme
                                                  .bodyText1
                                                  .override(
                                                fontFamily: 'Playfair Display',
                                                fontSize: 16,
                                              ),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Playfair Display',
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment(-1, 0),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(10, 20, 0, 5),
                                child: InkWell(
                                  onTap: () async {
                                    await getUserInfoCall(
                                      name: columnUsersRecord.displayName,
                                    );
                                  },
                                  child: Text(
                                    'Added products',
                                    style: FlutterFlowTheme.subtitle1.override(
                                      fontFamily: 'Roboto',
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FFButtonWidget(
                                  onPressed: () async {
                                    await Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => HomePageWidget(
                                          username:
                                              columnUsersRecord.displayName,
                                        ),
                                      ),
                                      (r) => false,
                                    );
                                    await getUserInfoCall(
                                      name: columnUsersRecord.displayName,
                                    );
                                  },
                                  text: 'Refresh',
                                  icon: Icon(
                                    Icons.refresh_outlined,
                                    size: 15,
                                  ),
                                  options: FFButtonOptions(
                                    width: 130,
                                    height: 40,
                                    color: Color(0xFFFF7043),
                                    textStyle:
                                        FlutterFlowTheme.subtitle2.override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                      fontSize: 13,
                                    ),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: 12,
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment(1, 0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        await Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                TransactionPageWidget(
                                              username:
                                                  columnUsersRecord.displayName,
                                            ),
                                          ),
                                          (r) => false,
                                        );
                                      },
                                      text: 'Add list to payment',
                                      options: FFButtonOptions(
                                        width: 200,
                                        height: 40,
                                        color: Color(0xFFFF7043),
                                        textStyle:
                                            FlutterFlowTheme.subtitle1.override(
                                          fontFamily: 'Playfair Display',
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontWeight: FontWeight.normal,
                                        ),
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: 12,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            FutureBuilder<dynamic>(
                              future: getUserInfoCall(
                                name: widget.username,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                      child: CircularProgressIndicator());
                                }
                                final listViewGetUserInfoResponse =
                                    snapshot.data;
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
                                        final productsItem =
                                            products[productsIndex];
                                        return Card(
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          color: Color(0xFFF5F5F5),
                                          elevation: 0,
                                          child: Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 2),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                10, 5, 0, 5),
                                                        child: Text(
                                                          getJsonField(
                                                                  productsItem,
                                                                  r'$.name')
                                                              .toString(),
                                                          style:
                                                              FlutterFlowTheme
                                                                  .subtitle2
                                                                  .override(
                                                            fontFamily:
                                                                'Poppins',
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
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          getJsonField(
                                                                  productsItem,
                                                                  r'$.weight')
                                                              .toString(),
                                                          style:
                                                              FlutterFlowTheme
                                                                  .subtitle2
                                                                  .override(
                                                            fontFamily:
                                                                'Poppins',
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
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                                  0, 0, 10, 0),
                                                          child: Text(
                                                            getJsonField(
                                                                    productsItem,
                                                                    r'$.price')
                                                                .toString(),
                                                            style:
                                                                FlutterFlowTheme
                                                                    .subtitle2
                                                                    .override(
                                                              fontFamily:
                                                                  'Poppins',
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
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
