import 'package:firebase_database/firebase_database.dart';

class Community {
  String key;
  String communityName = "Community Name";
  bool isActive = true;
  String userId;
  int memberCount = 10;
  String details = "Community Details";
  String city = "City";
  String location = "Community Location";

  Community(this.communityName, this.userId, this.isActive, this.memberCount, this.details, this.city, this.location);

  Community.fromSnapshot(DataSnapshot snapshot) :
        key = snapshot.key,
        userId = snapshot.value["userId"],
        communityName = snapshot.value["communityName"],
        isActive = snapshot.value["isActive"],
        memberCount = snapshot.value["memberCount"],
        details = snapshot.value["details"],
        city = snapshot.value["city"],
        location = snapshot.value["location"];

  toJson() {
    return {
      "userId": userId,
      "communityName": communityName,
      "isActive": isActive,
      "memberCount": memberCount,
      "details": details,
      "city": city,
      "location": location,
    };
  }
}