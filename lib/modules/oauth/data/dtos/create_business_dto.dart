import 'package:json_annotation/json_annotation.dart';
part 'create_business_dto.g.dart';

@JsonSerializable(createFactory: false)
class CreateBusinessDTO {
  final String dsNomeFantasia;

  const CreateBusinessDTO({
    required this.dsNomeFantasia,
  });

  Map<String, dynamic> toJson() => _$CreateBusinessDTOToJson(this);
}
