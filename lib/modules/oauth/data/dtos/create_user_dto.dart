import 'package:json_annotation/json_annotation.dart';
part 'create_user_dto.g.dart';

@JsonSerializable(createFactory: false)
class CreateUserDTO {
  final String nmUser;
  final String dsEmail;
  final String dsPassword;
  final String confirmationPassword;

  const CreateUserDTO({
    required this.nmUser,
    required this.dsEmail,
    required this.dsPassword,
    required this.confirmationPassword,
  });

  Map<String, dynamic> toJson() => _$CreateUserDTOToJson(this);
}
