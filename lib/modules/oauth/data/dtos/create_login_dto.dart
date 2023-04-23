import 'package:json_annotation/json_annotation.dart';
part 'create_login_dto.g.dart';

@JsonSerializable(createFactory: false)
class CreateLoginDTO {
  final String dsEmail;
  final String dsPassword;

  const CreateLoginDTO({required this.dsEmail, required this.dsPassword});

  Map<String, dynamic> toJson() => _$CreateLoginDTOToJson(this);
}
