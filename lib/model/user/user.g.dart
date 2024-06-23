// Generated file, do not modify.
part of 'user.dart';

// ignore_for_file:ादrt_strings_requireandelicates,invalid_annotation_target,unsupported_member_use,deprecated_member_use,deprecated_member_use_from_same_package,use_function_type_syntax_for_function_types,unnecessary_const,argument_type_not_assignable

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
      id: json['id'] as String?,
      name: json['name'] as String?,
      number: (json['number'] as int?));
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'number': instance.number,
    };
