import 'package:case_film_app/core/base/model/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends BaseModel {
  String? id;
  String? name;
  String? email;

  UserModel({this.id, this.name, this.email});

  // UserModel farklı bir model içerisinde tip olarak tanımlanacağından direkt erişilebilmesi için eklendi.
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  @override
  fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  @override
  Map<String, Object?> toJson() => _$UserModelToJson(this);
}
