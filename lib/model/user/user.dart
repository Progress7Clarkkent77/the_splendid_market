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

  User({
    this.id,
    this.name,
    this.number,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
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
