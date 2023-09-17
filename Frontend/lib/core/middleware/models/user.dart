import 'card.dart';

class User {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? confirmPassword;
 Card? card;
 List<User>?contacts;
  User({this.id,this.firstName,this.lastName,this.email,this.card,this.contacts,
    this.password,this.confirmPassword});
  Map<String,dynamic> toJson()=>{
    "first_name":firstName,
    "last_name":lastName,

     "email": email,
    "password": password,
    "password_confirmation" : confirmPassword,
  };

  factory User.fromJson (Map<String,dynamic> json)=>
      User(
        id:json['id'],
        firstName: json["first_name"],
          lastName: json["lastName"],
        email: json["email"],
        card:  json["card"]!=null?Card.fromJson(json['card']):null,
        contacts: json['contacts']!=null?
          List<User>.of(json['contacts'].map<User>((val)=>User.fromJson(val))):
          null

      );
}