import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paribu_mobile/core/constant/app_page_routes.dart';
import 'package:paribu_mobile/core/extension/generic_extension.dart';
import 'package:paribu_mobile/core/init/injection_container.dart';
import 'package:paribu_mobile/core/utils/route_manager.dart';
import 'package:paribu_mobile/core/utils/ui_state.dart';
import 'package:paribu_mobile/feature/wallet/bloc/state/wallet_state.dart';
import 'package:paribu_mobile/feature/wallet/data/dto/wallet_dto.dart';
import 'package:paribu_mobile/feature/wallet/data/repo/i_wallet_repo.dart';

class WalletCubit extends Cubit<WalletState> {
  WalletCubit() : super(WalletState());

  final _walletRepo = sl<IWalletRepo>();

  final TextEditingController controller = TextEditingController();

  Future<void> initialize() async {
    _fetchWallets();
  }

  Future<void> _fetchWallets() async {
    emit(state.copyWith(walletsStatus: UIStateStatus.loading));
    final fetchWalletEither = await _walletRepo.fetchWallets();
    fetchWalletEither.fold(
      (failure) {
        emit(state.copyWith(wallets: [], walletsStatus: UIStateStatus.error, failure: failure));
      },
      (data) {
        emit(state.copyWith(wallets: data, walletsStatus: UIStateStatus.success));
      },
    );
  }

  void createWallet() async {
    try {
      emit(state.copyWith(isLoading: true));
      if (controller.text.isEmpty) return;

      final createWalletEither = await _walletRepo.createWallet(controller.text);
      createWalletEither.fold((failure) {}, (data) {
        _walletRepo.saveWallets([...state.wallets, data]);
        emit(state.copyWith(wallets: [...state.wallets, data]));
      });
    } finally {
      emit(state.copyWith(isLoading: false));
      RouteManager().pop();
      controller.clear();
    }
  }

  void deleteWallet(WalletDto wallet) {
    final wallets = List<WalletDto>.from(state.wallets);
    wallets.removeWhere((element) => element.address.isEquals(wallet.address));
    emit(state.copyWith(wallets: [...wallets]));
    _walletRepo.saveWallets([...wallets]);
  }

  Future<void> exportWallet({required WalletDto wallet, required String password}) async {
    final exportWalletEither = await _walletRepo.exportWallet(password, wallet);
    exportWalletEither.fold((failure) {
      failure.showSnackBar();
    }, (data) => RouteManager().popUntil(predicate: (route) => route.settings.name.isEquals(AppPageRoutes.walletManage.name)));
  }

  Future<void> importWallet({required String password}) async {}
}
