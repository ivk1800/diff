import 'package:json_annotation/json_annotation.dart';

import 'repo_entity.dart';

part 'repos_entity.g.dart';

@JsonSerializable()
class ReposEntity {
  ReposEntity({
    required this.repos,
  });

  List<RepoEntity> repos;

  factory ReposEntity.fromJson(Map<String, dynamic> json) =>
      _$ReposEntityFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$ReposEntityToJson(this);
}
