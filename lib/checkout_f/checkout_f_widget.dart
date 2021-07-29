import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckoutFWidget extends StatefulWidget {
  CheckoutFWidget({
    Key key,
    this.framename,
    this.productprice,
    this.username,
    this.deliveryaddress,
    this.lenstype,
  }) : super(key: key);

  final String framename;
  final String productprice;
  final String username;
  final String deliveryaddress;
  final String lenstype;

  @override
  _CheckoutFWidgetState createState() => _CheckoutFWidgetState();
}

class _CheckoutFWidgetState extends State<CheckoutFWidget> {
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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(16, 4, 16, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      'Checkout',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.subtitle1.override(
                        fontFamily: 'Raleway',
                        color: Color(0xFF151B1E),
                        fontSize: 20,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: InkWell(
                onTap: () async {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.keyboard_arrow_down,
                  color: Color(0xFF95A1AC),
                  size: 40,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 4, 16, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    '${widget.framename} - ${widget.productprice} - ${widget.lenstype}',
                    style: FlutterFlowTheme.subtitle1.override(
                      fontFamily: 'Raleway',
                      color: Color(0xFF151B1E),
                      fontSize: 15,
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 450,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.tertiaryColor,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 330,
                                height: 180,
                                decoration: BoxDecoration(
                                  color: Color(0xFF3D2DC5),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: FlutterFlowTheme.primaryColor,
                                  elevation: 6,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment: Alignment(0, 0.64),
                                        child: TextFormField(
                                          controller: textController,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            hintText: '[Some hint text...]',
                                            hintStyle: FlutterFlowTheme
                                                .bodyText1
                                                .override(
                                              fontFamily: 'Raleway',
                                              color: Colors.white,
                                            ),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                          ),
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Raleway',
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment(-0.8, 0.8),
                                        child: Text(
                                          '•••• •••• •••• 3452',
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Raleway',
                                            color: Color(0x7EFFFFFF),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment(0.8, 0.65),
                                        child: Image.asset(
                                          'assets/images/masterCard.svg',
                                          width: 60,
                                          height: 30,
                                          fit: BoxFit.fitHeight,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(16, 20, 0, 4),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Amount',
                                style: FlutterFlowTheme.bodyText2.override(
                                  fontFamily: 'Raleway',
                                  color: Color(0xFF95A1AC),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(12, 0, 0, 0),
                                child: Text(
                                  widget.productprice,
                                  style: FlutterFlowTheme.title1.override(
                                    fontFamily: 'Raleway',
                                    fontSize: 36,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
                          child: Container(
                            width: 330,
                            height: 2,
                            decoration: BoxDecoration(
                              color: Color(0xFFDCE0E4),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(16, 12, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Business Name',
                                style: FlutterFlowTheme.bodyText2.override(
                                  fontFamily: 'Raleway',
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(16, 12, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Purchase Date',
                                style: FlutterFlowTheme.bodyText2.override(
                                  fontFamily: 'Raleway',
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(16, 4, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'May 4th, 4:49pm - 2021',
                                style: FlutterFlowTheme.subtitle1.override(
                                  fontFamily: 'Raleway',
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
