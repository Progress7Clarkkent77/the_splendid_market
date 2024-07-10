import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: "id")
  String? id;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "number")
  int? number;

  @JsonKey(name: "password")
  String? password;

  @JsonKey(name: "email") // Added field
  String? email;

  @JsonKey(name: "image")
  String? image;

  @JsonKey(name: "accountNumber") // Added field
  String? accountNumber;

  @JsonKey(name: "accountName") // Added field
  String? accountName;

  @JsonKey(name: "businessName") // Added field
  String? businessName;

  @JsonKey(name: "businessLocation") // Added field
  String? businessLocation;

  User(
      {this.id,
      this.name,
      this.number,
      this.password,
      this.email,
      this.image,
      this.accountNumber,
      this.accountName,
      this.businessName,
      this.businessLocation});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
