import 'package:flutter/material.dart';
import 'imagerotater.dart';


class GalleryView extends StatefulWidget {
  @override
  _GalleryViewState createState() => _GalleryViewState();
}

class _GalleryViewState extends State<GalleryView> {
  var currentIndex = 1;
  @override
  Widget build(BuildContext context) {

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



    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new IconButton(
            icon: new Icon(Icons.chevron_left, size: 40,),
            onPressed: () {
              setState(() {
                if(currentIndex != 0 ){
                  currentIndex = --currentIndex; }
              });
              
            },
          ),
          new Container(
            width: MediaQuery.of(context).size.width * 60,
            height: 200,
            child:Image.network(imageList[currentIndex]),
            // child: ImageRotater(imageList),
          ),
          new IconButton(
            icon: new Icon(Icons.chevron_right, size: 40),
            onPressed: () {
              setState(() {
                if(currentIndex !=imageList.length-1 ){
                    currentIndex = ++currentIndex;
                }
              });
            },
          )
        ],
      ),
    );

  }
}