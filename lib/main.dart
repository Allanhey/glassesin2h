import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'auth/firebase_user_provider.dart';
import 'package:glasses_in_2h/welcomepage_f/welcomepage_f_widget.dart';
import 'package:glasses_in_2h/home_shop_f/home_shop_f_widget.dart';
import 'flutter_flow/flutter_flow_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Stream<GlassesIn2hFirebaseUser> userStream;
  GlassesIn2hFirebaseUser initialUser;

  @override
  void initState() {
    super.initState();
    userStream = glassesIn2hFirebaseUserStream()
      ..listen((user) => initialUser ?? setState(() => initialUser = user));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Glasses in 2h',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: initialUser == null
          ? Center(
              child: Builder(
                builder: (context) => Image.asset(
                  'assets/images/Screen Shot 2021-07-28 at 7.00.43 PM.png',
                  width: MediaQuery.of(context).size.width / 2,
                  fit: BoxFit.fitWidth,
                ),
              ),
            )
          : currentUser.loggedIn
              ? HomeShopFWidget()
              : WelcomepageFWidget(),
    );
  }
}
