import 'dart:convert';
import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:paribu_mobile/core/error/failure.dart';
import 'package:paribu_mobile/core/error/general_failures.dart';
import 'package:paribu_mobile/core/extension/generic_extension.dart';
import 'package:paribu_mobile/core/init/injection_container.dart';
import 'package:paribu_mobile/core/utils/aes_helper.dart';
import 'package:paribu_mobile/core/utils/app_file_picker.dart';
import 'package:paribu_mobile/core/utils/local_services/service/i_local_service.dart';
import 'package:paribu_mobile/core/utils/local_services/utils/enum/local_keys.dart';
import 'package:paribu_mobile/core/utils/local_services/utils/param/local_key_param.dart';
import 'package:paribu_mobile/core/utils/local_services/utils/param/local_key_with_value_param.dart';
import 'package:paribu_mobile/feature/wallet/data/dto/wallet_dto.dart';
import 'package:paribu_mobile/feature/wallet/data/repo/i_wallet_repo.dart';
import 'package:bip39/bip39.dart' as bip39;
import 'package:web3dart/credentials.dart';
import 'package:web3dart/crypto.dart';

class WalletRepo implements IWalletRepo {
  final _localService = sl<ILocalService>();

  @override
  Future<Either<Failure, WalletDto>> createWallet(String name) async {
    try {
      final mnemonic = bip39.generateMnemonic();
      final seed = bip39.mnemonicToSeed(mnemonic);
      final seedInt = bytesToInt(seed);
      final privateKey = EthPrivateKey.createRandom(Random(seedInt.toInt()));
      final address = privateKey.address;
      final encryptedMnemonic = AESHelper.encryptData(mnemonic);

      return Right(WalletDto(name: name, address: address.hexEip55, encryptedMnemonic: encryptedMnemonic));
    } catch (e) {
      return Left(ServiceFailure(error: "Create Wallet Err: $e"));
    }
  }

  @override
  Future<Either<Failure, void>> saveWallets(List<WalletDto> wallets) async {
    try {
      final walletJsonList = wallets.map((wallet) => wallet.toJson()).toList();

      _localService.saveDataFromKey(LocalKeyWithValueParam(key: LocalKeys.wallets, value: json.encode(walletJsonList)));
      return Right(null);
    } catch (e) {
      return Left(ServiceFailure(error: "Save Wallet Err: $e"));
    }
  }

  @override
  Future<Either<Failure, List<WalletDto>>> fetchWallets() async {
    try {
      final getDatEither = await _localService.getDataFromKey(LocalKeyParam(key: LocalKeys.wallets));
      return getDatEither.fold((failure) => Left(failure), (data) {
        final List<dynamic> dynamicList = json.decode(data);
        final wallets = dynamicList.map((e) => WalletDto.fromJson(e)).toList();
        return Right(wallets);
      });
    } catch (e) {
      return Left(ServiceFailure(error: "Save Wallet Err: $e"));
    }
  }

  @override
  Future<Either<Failure, void>> exportWallet(String password, WalletDto wallet) async {
    try {
      await AppFilePicker.exportFile(password: password, data: {"wallet": wallet.toJson()}, path: "wallet_${wallet.name}.json");
      return Right(null);
    } catch (e) {
      return Left(ServiceFailure(error: "Export Wallet Err: $e"));
    }
  }

  @override
  Future<Either<Failure, WalletDto>> importWallet(String password) async {
    try {
      final fileData = await AppFilePicker.importFile(password);
      if (fileData != null && fileData.containsKey('password_hash') && fileData.containsKey('wallet')) {
        return Right(WalletDto.fromJson(fileData['wallet']));
      }
      return Left(NullPointerFailure(error: "Import Wallet Err: ${fileData.isNull ? "Bir json dosyası seçiniz" : "Şifreleme hatası"}"));
    } catch (e) {
      return Left(ServiceFailure(error: "Import Wallet Err: $e"));
    }
  }
}
