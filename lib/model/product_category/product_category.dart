import 'package:json_annotation/json_annotation.dart';
part 'product_category.g.dart';

@JsonSerializable()
class ProductCategory {
  @JsonKey(name: "id")
  String? id;

  @JsonKey(name: "name")
  String? name;

  ProductCategory({
    this.id,
    this.name,
  });

  factory ProductCategory.fromJson(Map<String, dynamic> json) =>
      _$ProductCategoryFromJson(json);
  Map<String, dynamic> toJson() => _$ProductCategoryToJson(this);
}

// class ProductService {
//   static Future<List<User>> getLatestProducts() async {
//     FirebaseFirestore firestore = FirebaseFirestore.instance;
//     CollectionReference productCollection = firestore.collection('user');

//     QuerySnapshot productSnapshot = await productCollection.get();
//     return productSnapshot.docs
//         .map((doc) => User.fromJson(doc.data() as Map<String, dynamic>))
//         .toList();
//   }
// }
