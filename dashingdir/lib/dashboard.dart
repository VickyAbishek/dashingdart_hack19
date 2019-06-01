import 'package:flutter/material.dart';

class MyDashboard extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        // return _myListView(context);
        return new MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            appBar: AppBar(
              title: new Center(child: Text("Dashboard")),
            ),
          body: _myListView(context),
          floatingActionButton: new FloatingActionButton(
              elevation: 0.0,
              child: new Icon(Icons.add_circle),
              backgroundColor: new Color(0xFF2196F3),
              onPressed: (){}
          ),
          ),
          
        );
    } 
}

Widget _myListView(BuildContext context) {
      return MaterialApp(
        home: ListView.builder(
        itemBuilder: (context, position) {
          return CommunityContent();
          // return Card(
              // elevation: 10.0,
              // child:CommunityContent()
              // child: Padding(
                // padding: const EdgeInsets.all(10.0),
                // child: Text("name", textAlign: TextAlign.center, style: TextStyle(fontSize: 22.0),
                // child:CommunityContent()
          // ),
        // ),
    // );
  },),
);
}

class CommunityElement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: CommunityContent(),
      ),
    );
  }
}

class CommunityContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(""),
        new Row(
          children: <Widget>[
            Text("Area"),
            Icon(Icons.people, size: 40,),
            Text("85")
          ],
        )
      ],
    );
  }
}