// Generated file, do not modify.
part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    id: json['id'] as String?,
    name: json['name'] as String?,
    number: json['number'] as int?,
    password: json['password'] as String?,
    email: json['email'] as String?, // Added field
    image: json['image'] as String?,
    accountNumber: json['accountNumber'] as String?, // Added field
    accountName: json['accountName'] as String?,
    businessName: json['businessName'] as String?,
    businessLocation: json['businessLocation'] as String?, // Added field
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'number': instance.number,
      'password': instance.password,
      'email': instance.email, // Added field
      'image': instance.image,
      'accountNumber': instance.accountNumber, // Added field
      'accountName': instance.accountName,
      'businessName': instance.businessName, // Added field
      'businessLocation': instance.businessLocation, // Added field
    };
