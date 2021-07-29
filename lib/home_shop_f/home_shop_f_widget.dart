import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../custmer_prof_f/custmer_prof_f_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../product_page_f/product_page_f_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeShopFWidget extends StatefulWidget {
  HomeShopFWidget({Key key}) : super(key: key);

  @override
  _HomeShopFWidgetState createState() => _HomeShopFWidgetState();
}

class _HomeShopFWidgetState extends State<HomeShopFWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF262D34),
      body: Stack(
        children: [
          Align(
            alignment: Alignment(0, 0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 1,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.tertiaryColor,
                shape: BoxShape.rectangle,
              ),
              child: Align(
                alignment: Alignment(0, 1),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                              child: Text(
                                'Hey, ',
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.title1.override(
                                  fontFamily: 'Raleway',
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onLongPress: () async {
                              await signOut();
                            },
                            child: IconButton(
                              onPressed: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CustmerProfFWidget(),
                                  ),
                                );
                              },
                              icon: Icon(
                                Icons.account_circle,
                                color: Color(0xFFEE8B60),
                                size: 50,
                              ),
                              iconSize: 50,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: StreamBuilder<List<UsersRecord>>(
                              stream: queryUsersRecord(
                                singleRecord: true,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: CircularProgressIndicator(
                                        color: FlutterFlowTheme.secondaryColor,
                                      ),
                                    ),
                                  );
                                }
                                List<UsersRecord> textUsersRecordList =
                                    snapshot.data;
                                // Customize what your widget looks like with no query results.
                                if (snapshot.data.isEmpty) {
                                  return Container(
                                    height: 100,
                                    child: Center(
                                      child: Text('No results.'),
                                    ),
                                  );
                                }
                                final textUsersRecord =
                                    textUsersRecordList.first;
                                return Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 50, 20),
                                  child: Text(
                                    textUsersRecord.displayName,
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.title1.override(
                                      fontFamily: 'Raleway',
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 670,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.tertiaryColor,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 8,
                            color: Color(0x66000000),
                            offset: Offset(0, -4),
                          )
                        ],
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0),
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 16, 20, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Shop Glasses',
                                    style: FlutterFlowTheme.title1.override(
                                      fontFamily: 'Raleway',
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: StreamBuilder<List<FramesRecord>>(
                              stream: queryFramesRecord(),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: CircularProgressIndicator(
                                        color: FlutterFlowTheme.secondaryColor,
                                      ),
                                    ),
                                  );
                                }
                                List<FramesRecord> gridViewFramesRecordList =
                                    snapshot.data;
                                // Customize what your widget looks like with no query results.
                                if (snapshot.data.isEmpty) {
                                  return Container(
                                    height: 100,
                                    child: Center(
                                      child: Text('No results.'),
                                    ),
                                  );
                                }
                                return Padding(
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 90),
                                  child: GridView.builder(
                                    padding: EdgeInsets.zero,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10,
                                      childAspectRatio: 1,
                                    ),
                                    scrollDirection: Axis.vertical,
                                    itemCount: gridViewFramesRecordList.length,
                                    itemBuilder: (context, gridViewIndex) {
                                      final gridViewFramesRecord =
                                          gridViewFramesRecordList[
                                              gridViewIndex];
                                      return Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 10, 10, 0),
                                        child: InkWell(
                                          onTap: () async {
                                            await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ProductPageFWidget(
                                                  productName:
                                                      gridViewFramesRecord
                                                          .modelname,
                                                  productPrice:
                                                      gridViewFramesRecord
                                                          .price,
                                                  productImage:
                                                      gridViewFramesRecord
                                                          .glasseimg,
                                                ),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            width: 100,
                                            height: 100,
                                            decoration: BoxDecoration(
                                              color: Color(0x4CEE8B60),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: Container(
                                                            width: 100,
                                                            height: 100,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFFEEEEEE),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        0),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            0),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        10),
                                                                topRight: Radius
                                                                    .circular(
                                                                        10),
                                                              ),
                                                              shape: BoxShape
                                                                  .rectangle,
                                                            ),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        0),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            0),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        10),
                                                                topRight: Radius
                                                                    .circular(
                                                                        10),
                                                              ),
                                                              child:
                                                                  CachedNetworkImage(
                                                                imageUrl:
                                                                    gridViewFramesRecord
                                                                        .glasseimg,
                                                                width: 100,
                                                                height: 100,
                                                                fit: BoxFit
                                                                    .fitHeight,
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                0, 0, 0, 8),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .fromLTRB(
                                                                            3,
                                                                            3,
                                                                            3,
                                                                            0),
                                                                child: Text(
                                                                  gridViewFramesRecord
                                                                      .modelname,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  style: FlutterFlowTheme
                                                                      .subtitle1
                                                                      .override(
                                                                    fontFamily:
                                                                        'Raleway',
                                                                    fontSize:
                                                                        18,
                                                                  ),
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                0, 0, 0, 8),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .fromLTRB(
                                                                            3,
                                                                            3,
                                                                            3,
                                                                            0),
                                                                child: Text(
                                                                  gridViewFramesRecord
                                                                      .color,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  style: FlutterFlowTheme
                                                                      .subtitle1
                                                                      .override(
                                                                    fontFamily:
                                                                        'Raleway',
                                                                    fontSize:
                                                                        12,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .fromLTRB(
                                                                            3,
                                                                            3,
                                                                            3,
                                                                            0),
                                                                child: Text(
                                                                  gridViewFramesRecord
                                                                      .price,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .end,
                                                                  style: FlutterFlowTheme
                                                                      .subtitle1
                                                                      .override(
                                                                    fontFamily:
                                                                        'Raleway',
                                                                    fontSize:
                                                                        12,
                                                                  ),
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
