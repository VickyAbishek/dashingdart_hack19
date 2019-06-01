import 'package:dashingdir/models/community.dart';
import 'package:flutter/material.dart';
import 'package:dashingdir/pages/gallery.dart';

class AboutCommunity extends StatelessWidget {
  String communityName = "Pune Flutter Group";
  Community community;
  AboutCommunity(this.community);

  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        home:Scaffold(
          appBar: new AppBar(
            title: new Center(child: Text(community.communityName)),
          ),

          body: ListView(
            children: <Widget>[
              AboutUsHeader(),
              CommunityDetails(community.details),
              LocationHeader(),
              LocationDetails(community.location),
              SocialMediaHeader(),
              SocialMediaIcons(),
              GalleryHeader(),
              GalleryView()
            ],
          ),

          floatingActionButton: new FloatingActionButton(
              elevation: 0.0,
              child: new Icon(Icons.chat),
              backgroundColor: new Color(0xFF2196F3),
              onPressed: (){}
          ),
        )
    );
  }
}

class CommunityDetails extends StatelessWidget {
  // String aboutUsContent = "Asdf asd fasd fsd gadsg ag to query , your widget will be scheduled to be rebuilt, keeping your widget up-to-dateYou can use this function to query the size an orientation of the screen. When that information changes, your widget will be scheduled to be rebuilt, keeping your widget up-to-date.You can use this function to query the size an orientation of the screen. When that information changes, your widget will be scheduled to be rebuilt, keeping your widget up-to-date.";
  String aboutUsContent;
  CommunityDetails(this.aboutUsContent);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      decoration: new BoxDecoration(
          color: const Color(0xFF42a5f5),
          // color: Colors.white,
          boxShadow: [new BoxShadow(
            color: Colors.black,
            blurRadius: 20.0,
          ),]
      ),
      // margin: EdgeInsets.only(left: 15.0, right: 15.0),
      padding: EdgeInsets.all(10.0),
      width: MediaQuery.of(context).size.width * 0.80,
      alignment: Alignment.center,
      child: Text(
          aboutUsContent,
          style: new TextStyle(fontSize:14.0,
              // color: const Color(0xFFf5f5f5),
              color: Colors.black,
              // color: Colors.white,
              fontWeight: FontWeight.w500,
              fontFamily: "Roboto")
      ),
    );
  }
}

class AboutUsHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child:Text(
          ("About Us"),
          style: new TextStyle(
              fontSize:18.0,
              // color: const Color(0xFFf5f5f5),
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontFamily: "Roboto"),
          textAlign: TextAlign.center,
        )
    );
  }
}

class LocationHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child:Text(
          ("Location"),
          style: new TextStyle(
              fontSize:18.0,
              // color: const Color(0xFFf5f5f5),
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontFamily: "Roboto"),
          textAlign: TextAlign.center,
        )
    );
  }
}

class SocialMediaHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child:Text(
          ("Social Media Links"),
          style: new TextStyle(
              fontSize:18.0,
              // color: const Color(0xFFf5f5f5),
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontFamily: "Roboto"),
          textAlign: TextAlign.center,
        )
    );
  }
}

class GalleryHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child:Text(
          ("Gallery"),
          style: new TextStyle(
              fontSize:18.0,
              // color: const Color(0xFFf5f5f5),
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontFamily: "Roboto"),
          textAlign: TextAlign.center,
        )
    );
  }
}

class LocationDetails extends StatelessWidget {
  String location;
  LocationDetails(this.location);
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: new BoxDecoration(
            color: const Color(0xFF42a5f5),
            boxShadow: [new BoxShadow(
              color: Colors.black,
              blurRadius: 20.0,
            ),]
        ),
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.all(10.0),
        width: MediaQuery.of(context).size.width * 0.80,
        alignment: Alignment.center,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.60,
              child: LocationText(location),
            ),
            Icon(Icons.location_on, size: 40),
          ],
        )
    );
  }
}

class LocationText extends StatelessWidget {
  //String locationDetails = "Marigold complex, Wadgaon Sheri, Pune, Maharashtra 411014";
  LocationText(this.locationDetails);
  String locationDetails;
  @override
  Widget build(BuildContext context) {
    return Text(
      locationDetails,
      style: new TextStyle(fontSize:12.0,
          // color: const Color(0xFFf5f5f5),
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontFamily: "Roboto"),
      textAlign: TextAlign.left,
    );
  }
}

class SocialMediaIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.80,
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(10.0),
      alignment: Alignment.center,
      decoration: new BoxDecoration(
          color: const Color(0xFF42a5f5),
          boxShadow: [new BoxShadow(
            color: Colors.black,
            blurRadius: 20.0,
          ),]
      ),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          // whatsapp/ fb/ telegram twitter
          Icon(Icons.whatshot, size: 40),
          Icon(Icons.face, size: 40),
          Icon(Icons.wifi, size: 40),
          Icon(Icons.phone, size: 40)
        ],
      ),
    );
  }
}

class ImageView extends StatelessWidget {

  var imageList = [
  "https://firebasestorage.googleapis.com/v0/b/dashingdart-151099.appspot.com/o/WhatsApp%20Image%202019-06-01%20at%205.11.02%20PM%20(1).jpeg?alt=media&token=7d922861-3095-4cd4-b84f-e2ce2b27f5e2",
  "https://firebasestorage.googleapis.com/v0/b/dashingdart-151099.appspot.com/o/WhatsApp%20Image%202019-06-01%20at%205.11.02%20PM%20(2).jpeg?alt=media&token=55314b01-c8e4-48ec-abb5-51e09838b684",
  "https://firebasestorage.googleapis.com/v0/b/dashingdart-151099.appspot.com/o/WhatsApp%20Image%202019-06-01%20at%205.11.02%20PM.jpeg?alt=media&token=6cdf7f5a-7fec-4488-9c5c-3e7c03c4db0b",
  "https://firebasestorage.googleapis.com/v0/b/dashingdart-151099.appspot.com/o/WhatsApp%20Image%202019-06-01%20at%205.11.03%20PM%20(1).jpeg?alt=media&token=a4073a71-8cc0-4f18-8822-3347d53a30d9",
  "https://firebasestorage.googleapis.com/v0/b/dashingdart-151099.appspot.com/o/WhatsApp%20Image%202019-06-01%20at%205.11.04%20PM%20(1).jpeg?alt=media&token=164786ab-9763-43f5-b04a-5edf30394c26",
  "https://firebasestorage.googleapis.com/v0/b/dashingdart-151099.appspot.com/o/WhatsApp%20Image%202019-06-01%20at%205.11.04%20PM%20(2).jpeg?alt=media&token=47cc8bcc-f422-4a56-b840-b40a1c418567",
  "https://firebasestorage.googleapis.com/v0/b/dashingdart-151099.appspot.com/o/WhatsApp%20Image%202019-06-01%20at%205.11.04%20PM%20(2).jpeg?alt=media&token=47cc8bcc-f422-4a56-b840-b40a1c418567",
  "https://firebasestorage.googleapis.com/v0/b/dashingdart-151099.appspot.com/o/WhatsApp%20Image%202019-06-01%20at%205.11.08%20PM.jpeg?alt=media&token=aaa73bcc-db7b-43c0-ac7b-705dd89445aa",
  "https://firebasestorage.googleapis.com/v0/b/dashingdart-151099.appspot.com/o/WhatsApp%20Image%202019-06-01%20at%205.11.08%20PM.jpeg?alt=media&token=aaa73bcc-db7b-43c0-ac7b-705dd89445aa",
  "https://firebasestorage.googleapis.com/v0/b/dashingdart-151099.appspot.com/o/WhatsApp%20Image%202019-06-01%20at%205.11.07%20PM.jpeg?alt=media&token=3da43693-ab0b-4f1d-bbc7-cc4e4637d687",
  "https://firebasestorage.googleapis.com/v0/b/dashingdart-151099.appspot.com/o/WhatsApp%20Image%202019-06-01%20at%205.11.07%20PM%20(1).jpeg?alt=media&token=4d6c63de-6739-46e2-a68c-73a7df779f20",
  "https://firebasestorage.googleapis.com/v0/b/dashingdart-151099.appspot.com/o/WhatsApp%20Image%202019-06-01%20at%205.11.05%20PM.jpeg?alt=media&token=c3cc227a-a550-4f77-acc4-ce8446bf5e52",
  "https://firebasestorage.googleapis.com/v0/b/dashingdart-151099.appspot.com/o/WhatsApp%20Image%202019-06-01%20at%205.11.07%20PM%20(1).jpeg?alt=media&token=4d6c63de-6739-46e2-a68c-73a7df779f20",
  "https://firebasestorage.googleapis.com/v0/b/dashingdart-151099.appspot.com/o/WhatsApp%20Image%202019-06-01%20at%205.11.06%20PM.jpeg?alt=media&token=f08020c7-5391-4d1a-ae6c-599e988dd2cd",
  "https://firebasestorage.googleapis.com/v0/b/dashingdart-151099.appspot.com/o/WhatsApp%20Image%202019-06-01%20at%205.11.02%20PM%20(2).jpeg?alt=media&token=55314b01-c8e4-48ec-abb5-51e09838b684"
  ];

  var currentIndex = 0;
  ImageView(this.currentIndex);
  @override
  Widget build(BuildContext context ) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.10,
        height: 200,
        child: Image.network(imageList[currentIndex]));

  }
}