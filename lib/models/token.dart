// To parse this JSON data, do
//
//     final token = tokenFromJson(jsonString);

import 'dart:convert';

Token tokenFromJson(String str) => Token.fromJson(json.decode(str));

class Token {
    String accessToken;
    String tokenType;
    int expiresIn;

    Token({
        required this.accessToken,
        required this.tokenType,
        required this.expiresIn,
    });

    factory Token.fromJson(Map<String, dynamic> json) => Token(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        expiresIn: json["expires_in"],
    );
}
