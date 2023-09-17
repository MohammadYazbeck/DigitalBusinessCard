import 'package:business_card/core/middleware/models/user.dart';

import 'card.dart';

class Auth {
  User? user;
  String? token;
  Card? card;

  Auth({this.token, this.user, this.card});

  factory Auth.fromJson(Map<String, dynamic> json) => Auth(
      user: User.fromJson(json['user']),
      token: json['authorization']?['token'],
      card: json['card'] != null ? Card.fromJson(json['card']) : null);
}
