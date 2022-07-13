import 'package:cloud_firestore/cloud_firestore.dart';

class User
{
 final String userName;
 final String id;
 final String email;
 final String photoUrl;
 final String displayName;
 final String bio;
  User({
   required this.userName,
   required this.id,
   required this.email,
   required this.photoUrl,
   required this.displayName,
   required this.bio,
  });

  factory User.fromDocument(DocumentSnapshot doc)
  {
   return User(
       userName: doc["userName"],
       id: doc["id"],
       email:  doc["email"],
       photoUrl:  doc["photoUrl"],
       displayName:  doc["displayName"],
       bio:  doc["bio"],
   );
  }


}