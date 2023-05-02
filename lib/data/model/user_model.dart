import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:martin_michelle/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({String name, String email, String uid, String profileUrl})
      : super(name, email, uid, profileUrl);

  factory UserModel.fromJson(Map<String,dynamic> json){
    return UserModel(
      name: json['name'],
      profileUrl: json['profileUrl'],
      email: json['email'],
      uid: json['uid']
    );
  }
  factory UserModel.fromSnapshot(DocumentSnapshot documentSnapshot){
    return UserModel(
      name: (documentSnapshot.data() as Map<String, dynamic>)['name'],
      uid: (documentSnapshot.data() as Map<String, dynamic>)['uid'],
      email: (documentSnapshot.data() as Map<String, dynamic>)['email'],
      profileUrl: (documentSnapshot.data() as Map<String, dynamic>)['profileUrl'],
    );
  }
  Map<String,dynamic> toDocument(){
    return {
      "name" :name,
      "uid" :uid,
      "email":email,
      "profileUrl":profileUrl,
    };
  }
}
