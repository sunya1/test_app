// To parse this JSON data, do
//
//     final userInfo = userInfoFromJson(jsonString);

import 'package:meta/meta.dart';

UserInfo userInfoFromJson(dynamic str) => UserInfo.fromJson(str);


class UserInfo {
    UserInfo({
       required this.accessToken,
         this.refreshToken,
         this.accessTokenExpiration,
         this.refreshTokenExpiration,
         this.user,
    });

    final String accessToken;
    final String? refreshToken;
    final int? accessTokenExpiration;
    final int? refreshTokenExpiration;
    final User? user;

    UserInfo copyWith({
        String? accessToken,
        String? refreshToken,
        int? accessTokenExpiration,
        int? refreshTokenExpiration,
        User? user,
    }) => 
        UserInfo(
            accessToken: accessToken ?? this.accessToken,
            refreshToken: refreshToken ?? this.refreshToken,
            accessTokenExpiration: accessTokenExpiration ?? this.accessTokenExpiration,
            refreshTokenExpiration: refreshTokenExpiration ?? this.refreshTokenExpiration,
            user: user ?? this.user,
        );

    factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        accessToken: json["accessToken"],
        refreshToken: json["refreshToken"],
        accessTokenExpiration: json["accessTokenExpiration"],
        refreshTokenExpiration: json["refreshTokenExpiration"],
        user: User.fromJson(json["user"]),
    );

    
}

class User {
    User({
        @required this.userId,
        @required this.firstName,
        @required this.lastName,
        @required this.email,
        @required this.imageUrl,
    });

    final String? userId;
    final String? firstName;
    final String? lastName;
    final String? email;
    final String? imageUrl;

    User copyWith({
        String? userId,
        String? firstName,
        String? lastName,
        String? email,
        String? imageUrl,
      
        String? fcmToken,
    }) => 
        User(
            userId: userId ?? this.userId,
            firstName: firstName ?? this.firstName,
            lastName: lastName ?? this.lastName,
            email: email ?? this.email,
            imageUrl: imageUrl ?? this.imageUrl,
        );

    factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json["userId"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        imageUrl: json["imageUrl"],
    );

}
