import '../checkout_f/checkout_f_widget.dart';
import '../flutter_flow/flutter_flow_drop_down_template.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class ProductPageFWidget extends StatefulWidget {
  ProductPageFWidget({
    Key key,
    this.productName,
    this.productPrice,
    this.productImage,
  }) : super(key: key);

  final String productName;
  final String productPrice;
  final String productImage;

  @override
  _ProductPageFWidgetState createState() => _ProductPageFWidgetState();
}

class _ProductPageFWidgetState extends State<ProductPageFWidget> {
  String dropDownValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.tertiaryColor,
      body: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Image.network(
                                widget.productImage,
                                width: MediaQuery.of(context).size.width,
                                height: 350,
                                fit: BoxFit.fitHeight,
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  widget.productName,
                                  style: FlutterFlowTheme.title1.override(
                                    fontFamily: 'Playfair Display',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    widget.productPrice,
                                    textAlign: TextAlign.end,
                                    style: FlutterFlowTheme.subtitle1.override(
                                      fontFamily: 'Raleway',
                                      color: FlutterFlowTheme.primaryColor,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 0, 20, 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                                    child: Text(
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                                      style:
                                          FlutterFlowTheme.bodyText2.override(
                                        fontFamily: 'Raleway',
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                                    child: FlutterFlowDropDown(
                                      options: [
                                        'Prescription',
                                        'Prescription Sunglasses',
                                        'Sunglasses'
                                      ],
                                      onChanged: (value) {
                                        setState(() => dropDownValue = value);
                                      },
                                      width: 130,
                                      height: 50,
                                      textStyle:
                                          FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'Raleway',
                                        color: Color(0xFF090F13),
                                        fontSize: 16,
                                      ),
                                      icon: Icon(
                                        Icons.arrow_drop_down_rounded,
                                        color: Color(0xFF95A1AC),
                                        size: 15,
                                      ),
                                      fillColor: Colors.white,
                                      elevation: 2,
                                      borderColor: Color(0xFFDBE2E7),
                                      borderWidth: 2,
                                      borderRadius: 8,
                                      margin: EdgeInsets.fromLTRB(24, 4, 8, 4),
                                      hidesUnderline: true,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 24, 0, 20),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Material(
                            color: Colors.transparent,
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: 70,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.primaryColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(0, 1, 0, 0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    await Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.bottomToTop,
                                        duration: Duration(milliseconds: 200),
                                        reverseDuration:
                                            Duration(milliseconds: 200),
                                        child: CheckoutFWidget(),
                                      ),
                                    );
                                  },
                                  text: 'Place Order ${widget.productPrice}',
                                  options: FFButtonOptions(
                                    color: FlutterFlowTheme.primaryColor,
                                    textStyle:
                                        FlutterFlowTheme.subtitle2.override(
                                      fontFamily: 'Raleway',
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: 8,
                                  ),
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
          Padding(
            padding: EdgeInsets.fromLTRB(10, 50, 10, 0),
            child: InkWell(
              onTap: () async {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.chevron_left_rounded,
                color: Color(0xFF8B97A2),
                size: 40,
              ),
            ),
          )
        ],
      ),
    );
  }
}
