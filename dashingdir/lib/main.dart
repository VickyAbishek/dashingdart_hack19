import 'package:flutter/material.dart';
import 'package:dashingdir/gallery.dart';

void main() => runApp(AboutCommunity());

class AboutCommunity extends StatelessWidget {
  String communityName = "Pune Flutter Group";

  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        appBar: new AppBar(
          title: Text(communityName),
        ),
        
        body: ListView(
          children: <Widget>[
            AboutUsHeader(),
                  CommunityDetails(),
                  LocationHeader(),
                  LocationDetails(),
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
  String aboutUsContent = "Asdf asd fasd fsd gadsg ag to query , your widget will be scheduled to be rebuilt, keeping your widget up-to-dateYou can use this function to query the size an orientation of the screen. When that information changes, your widget will be scheduled to be rebuilt, keeping your widget up-to-date.You can use this function to query the size an orientation of the screen. When that information changes, your widget will be scheduled to be rebuilt, keeping your widget up-to-date.";

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
              child: LocationText(),
            ),
            Icon(Icons.location_on, size: 40),
        ],
      )
    );
  }
}

class LocationText extends StatelessWidget {
  String locationDetails = "Marigold complex, Wadgaon Sheri, Pune, Maharashtra 411014";

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
    "https://uae.microless.com/cdn/no_image.jpg",
    "https://images-na.ssl-images-amazon.com/images/I/81aF3Ob-2KL._UX679_.jpg",
    "https://www.boostmobile.com/content/dam/boostmobile/en/products/phones/apple/iphone-7/silver/device-front.png.transform/pdpCarousel/image.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgUgs8_kmuhScsx-J01d8fA1mhlCR5-1jyvMYxqCB8h3LCqcgl9Q",
    "https://ae01.alicdn.com/kf/HTB11tA5aiAKL1JjSZFoq6ygCFXaw/Unlocked-Samsung-GALAXY-S2-I9100-Mobile-Phone-Android-Wi-Fi-GPS-8-0MP-camera-Core-4.jpg_640x640.jpg",
    "https://media.ed.edmunds-media.com/gmc/sierra-3500hd/2018/td/2018_gmc_sierra-3500hd_f34_td_411183_1600.jpg",
    "https://hips.hearstapps.com/amv-prod-cad-assets.s3.amazonaws.com/images/16q1/665019/2016-chevrolet-silverado-2500hd-high-country-diesel-test-review-car-and-driver-photo-665520-s-original.jpg",
    "https://www.galeanasvandykedodge.net/assets/stock/ColorMatched_01/White/640/cc_2018DOV170002_01_640/cc_2018DOV170002_01_640_PSC.jpg",
    "https://media.onthemarket.com/properties/6191869/797156548/composite.jpg",
    "https://media.onthemarket.com/properties/6191840/797152761/composite.jpg",
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
