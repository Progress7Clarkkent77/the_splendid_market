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

  @JsonKey(name: "accountNumber") // Added field
  String? accountNumber;

  @JsonKey(name: "businessName") // Added field
  String? businessName;

  User(
      {this.id,
      this.name,
      this.number,
      this.password,
      this.email,
      this.accountNumber,
      this.businessName});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
