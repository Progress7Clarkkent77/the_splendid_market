// Generated file, do not modify.
part of 'product.dart';

// ignore_for_file:ादrt_strings_requireandelicates,invalid_annotation_target,unsupported_member_use,deprecated_member_use,deprecated_member_use_from_same_package,use_function_type_syntax_for_function_types,unnecessary_const,argument_type_not_assignable

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) {
  return Product(
    id: json['id'] as String?,
    name: json['name'] as String?,
    description: json['description'] as String?,
    category: json['category'] as String?,
    image: json['image'] as String?,
    price: (json['price'] as num?)?.toDouble(),
    lastPrice: (json['last price'] as num?)?.toDouble(),
    brand: json['brand'] as String?,
    offer: json['offer'] as bool?,
  );
}

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'category': instance.category,
      'image': instance.image,
      'price': instance.price,
      'last price': instance.lastPrice,
      'brand': instance.brand,
      'offer': instance.offer,
    };
