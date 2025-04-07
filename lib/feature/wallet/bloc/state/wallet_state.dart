import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:crypto_wallet_mobile/core/error/failure.dart';
import 'package:crypto_wallet_mobile/core/utils/ui_state.dart';
import 'package:crypto_wallet_mobile/feature/wallet/data/dto/wallet_dto.dart';

part 'wallet_state.freezed.dart';

@freezed
abstract class WalletState with _$WalletState {
  const factory WalletState({
    @Default([]) List<WalletDto> wallets,
    @Default(UIStateStatus.idle) UIStateStatus walletsStatus,
    Failure? failure,
    @Default(false) bool isLoading,
  }) = _WalletState;
}
