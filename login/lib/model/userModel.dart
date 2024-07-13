import 'dart:convert';

class UserModel {
    final String? id;
    final String? email;
    final dynamic name;
    final dynamic lastName;
    final String? password;
    final dynamic phone;
    final String? role;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final String? hashedRt;

    UserModel({
        this.id,
        this.email,
        this.name,
        this.lastName,
        this.password,
        this.phone,
        this.role,
        this.createdAt,
        this.updatedAt,
        this.hashedRt,
    });

    factory UserModel.fromRawJson(String str) => UserModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        email: json["email"],
        name: json["name"],
        lastName: json["lastName"],
        password: json["password"],
        phone: json["phone"],
        role: json["role"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        hashedRt: json["hashedRt"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "name": name,
        "lastName": lastName,
        "password": password,
        "phone": phone,
        "role": role,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "hashedRt": hashedRt,
    };
}
