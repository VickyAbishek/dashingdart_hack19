import 'package:dashingdir/pages/root_page.dart';
import 'package:dashingdir/services/authentication.dart';
import 'package:flutter/material.dart';
import 'about.dart';
import 'dashboard.dart';

<<<<<<< HEAD
// void main() => runApp(AboutCommunity());
void main() => runApp(MyDashboard());
=======
void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Dashing Dart',
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new RootPage(auth: new Auth()));
  }
}
>>>>>>> 69c37284a1ef10772ae0847bec863946c91db824
