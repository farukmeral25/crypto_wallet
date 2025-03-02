import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet_dto.g.dart';

@JsonSerializable()
class WalletDto {
  final String name;
  final String address;
  final String mnemonic;
  final String recoveryPhrase;

  WalletDto({required this.name, required this.address, required this.mnemonic, required this.recoveryPhrase});

  factory WalletDto.fromJson(Map<String, dynamic> json) => _$WalletDtoFromJson(json);

  Map<String, dynamic> toJson() => _$WalletDtoToJson(this);
}
