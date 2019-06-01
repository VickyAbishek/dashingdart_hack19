import 'package:dashingdir/pages/home_page.dart';
import 'package:dashingdir/pages/root_page.dart';
import 'package:dashingdir/services/authentication.dart';
import 'package:flutter/material.dart';
void main() {runApp(new MyApp());}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Dashing Dart',
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new RootPage(auth: new Auth()),
        routes: <String, WidgetBuilder>{
          "/dashboard": (BuildContext context) => HomePage(),
        },
    );
  }
}