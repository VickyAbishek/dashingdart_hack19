import 'package:flutter/material.dart';
import 'package:dashingdir/services/authentication.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:dashingdir/models/community.dart';
import 'package:dashingdir/pages/about.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.auth, this.userId, this.onSignedOut})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback onSignedOut;
  final String userId;

  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Community> _communityList;

  final FirebaseDatabase _database = FirebaseDatabase.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final _textEditingControllerCommunityName = TextEditingController();
  final _textEditingControllerMemberCount = TextEditingController();
  final _textEditingControllerDetails = TextEditingController();
  final _textEditingControllerCity = TextEditingController();
  StreamSubscription<Event> _onCommunityAddedSubscription;
  StreamSubscription<Event> _onCommunityChangedSubscription;

  Query _communityQuery;

  bool _isEmailVerified = false;

  @override
  void initState() {
    super.initState();

    _checkEmailVerification();

    _communityList = new List();
    _communityQuery = _database
        .reference()
        .child("community")
        .orderByChild("userId");
        //.equalTo(widget.userId);
    _onCommunityAddedSubscription = _communityQuery.onChildAdded.listen(_onEntryAdded);
    _onCommunityChangedSubscription = _communityQuery.onChildChanged.listen(_onEntryChanged);
  }

  void _checkEmailVerification() async {
    _isEmailVerified = await widget.auth.isEmailVerified();
    if (!_isEmailVerified) {
      _showVerifyEmailDialog();
    }
  }

  void _resentVerifyEmail(){
    widget.auth.sendEmailVerification();
    _showVerifyEmailSentDialog();
  }

  void _showVerifyEmailDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Verify your account"),
          content: new Text("Please verify account in the link sent to email"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Resent link"),
              onPressed: () {
                Navigator.of(context).pop();
                _resentVerifyEmail();
              },
            ),
            new FlatButton(
              child: new Text("Dismiss"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showVerifyEmailSentDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Verify your account"),
          content: new Text("Link to verify account has been sent to your email"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Dismiss"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _onCommunityAddedSubscription.cancel();
    _onCommunityChangedSubscription.cancel();
    super.dispose();
  }

  _onEntryChanged(Event event) {
    var oldEntry = _communityList.singleWhere((entry) {
      return entry.key == event.snapshot.key;
    });

    setState(() {
      _communityList[_communityList.indexOf(oldEntry)] = Community.fromSnapshot(event.snapshot);
    });
  }

  _onEntryAdded(Event event) {
    setState(() {
      _communityList.add(Community.fromSnapshot(event.snapshot));
    });
  }

  _signOut() async {
    try {
      await widget.auth.signOut();
      widget.onSignedOut();
    } catch (e) {
      print(e);
    }
  }

  _addNewCommunity(String communityItem, int memberCount, String details, String city) {
    if (communityItem.length > 0) {

      Community community = new Community(communityItem.toString(), widget.userId, true, memberCount, details, city, city);
      _database.reference().child("community").push().set(community.toJson());
    }
  }

  _updateCommunity(Community community){
    //Toggle completed
    community.isActive = !community.isActive;
    if (community != null) {
      _database.reference().child("community").child(community.key).set(community.toJson());
    }

    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
      return AboutCommunity(community);
    }));

//    Navigator.push( builder: (context) => AboutCommunity() );

  }

  _deleteCommunity(String communityId, int index) {
    _database.reference().child("community").child(communityId).remove().then((_) {
      print("Delete $communityId successful");
      setState(() {
        _communityList.removeAt(index);
      });
    });
  }

  _showDialog(BuildContext context) async {
    _textEditingControllerCommunityName.clear();
    _textEditingControllerMemberCount.clear();
    _textEditingControllerDetails.clear();
    _textEditingControllerCity.clear();
    await showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: new Column(
              children: <Widget>[
                new Expanded(child: new TextField(
                  controller: _textEditingControllerCommunityName,
                  autofocus: true,
                  decoration: new InputDecoration(
                    labelText: 'Community Name',
                  ),
                )),
                new Expanded(child: new TextField(
                  controller: _textEditingControllerMemberCount,
                  decoration: new InputDecoration(labelText: 'memberCount'),
                  keyboardType: TextInputType.number,
                )),
                new Expanded(child: new TextField(
                  controller: _textEditingControllerDetails,
                  decoration: new InputDecoration(labelText: 'details'),
                )),
                new Expanded(child: new TextField(
                  controller: _textEditingControllerCity,
                  decoration: new InputDecoration(labelText: 'city'),
                )),
              ],
            ),
            actions: <Widget>[
              new FlatButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              new FlatButton(
                  child: const Text('Save'),
                  onPressed: () {
                    _addNewCommunity(
                      _textEditingControllerCommunityName.text.toString(),
                      int.tryParse(_textEditingControllerMemberCount.text.toString()),
                      _textEditingControllerDetails.text.toString(),
                      _textEditingControllerCity.text.toString(),
                    );
                    Navigator.pop(context);
                  })
            ],
          );
        }
    );
  }

  Widget _showCommunityList() {
    if (_communityList.length > 0) {
      return ListView.builder(
          shrinkWrap: true,
          itemCount: _communityList.length,
          itemBuilder: (BuildContext context, int index) {
            String communityId = _communityList[index].key;
            String subject = _communityList[index].communityName;
            bool completed = _communityList[index].isActive;
            String userId = _communityList[index].userId;
            String location = _communityList[index].location;
            var membersCount = _communityList[index].memberCount;

            return Dismissible(
              key: Key(communityId),
              background: Container(color: Colors.red),
              onDismissed: (direction) async {
                _deleteCommunity(communityId, index);
              },
              child: ListTile(
                title: Card(
                  elevation: 9.0,
                  child: Padding(
                  padding: const EdgeInsets.all(8.0),
//                  child: Text(subject, textAlign: TextAlign.center, style: TextStyle(fontSize: 22.0)),
                  child: Column(
                    children: <Widget>[
                      Text("Community: "+ subject, textAlign: TextAlign.start, style: TextStyle(fontSize: 30.0)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("City: " + location, textAlign: TextAlign.center, style: TextStyle(fontSize: 22.0)),
                          Text("Member: " + membersCount.toString(), textAlign: TextAlign.center, style: TextStyle(fontSize: 22.0)),
                        ],
                      )
                    ],

                  )
                  ),
                ),
            onLongPress: () {
              _updateCommunity(_communityList[index]);
            },
            onTap: (){
              _updateCommunity(_communityList[index]);
            },
            /*Text(
                  subject,
                  style: TextStyle(fontSize: 20.0),
                ),*/
//                trailing: IconButton(
//                    icon: (completed)
//                        ? Icon(
//                      Icons.arrow_forward_ios,
//                      color: Colors.green,
//                      size: 20.0,
//                    )
//                        : Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 20.0),
//                    onPressed: () {
//                      _updateCommunity(_communityList[index]);
//                    }),
              ),
            );
          });
    } else {
      return Center(child: Text("Welcome. List is empty",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 30.0),));
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Flutter Communities'),
          actions: <Widget>[
            new FlatButton(
                child: new Text('Logout',
                    style: new TextStyle(fontSize: 17.0, color: Colors.white)),
                onPressed: _signOut)
          ],
        ),
        body: _showCommunityList(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showDialog(context);
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        )
    );
  }
}