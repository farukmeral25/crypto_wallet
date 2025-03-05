import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:paribu_mobile/core/init/injection_container.dart';
import 'package:paribu_mobile/core/utils/aes_helper.dart';

part 'wallet_dto.g.dart';

@JsonSerializable()
class WalletDto {
  final String name;
  final String address;
  final String recoveryPhrase;

  WalletDto({required this.name, required this.address, required this.recoveryPhrase});

  factory WalletDto.fromJson(Map<String, dynamic> json) => _$WalletDtoFromJson(json);

  Map<String, dynamic> toJson() => _$WalletDtoToJson(this);

  String get mnemonic => sl<AESHelper>().decryptData(recoveryPhrase);
}
