import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet_dto.g.dart';

@JsonSerializable()
class WalletDto {
  final String name;
  final String address;
  final String encryptedMnemonic;

  WalletDto({required this.name, required this.address, required this.encryptedMnemonic});

  factory WalletDto.fromJson(Map<String, dynamic> json) => _$WalletDtoFromJson(json);

  Map<String, dynamic> toJson() => _$WalletDtoToJson(this);
}
