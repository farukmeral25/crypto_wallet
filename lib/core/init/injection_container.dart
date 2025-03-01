import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:paribu_mobile/core/constant/api/api_service.dart';
import 'package:paribu_mobile/core/utils/dio_manager.dart';
import 'package:paribu_mobile/core/utils/local_services/service/i_local_service.dart';
import 'package:paribu_mobile/core/utils/local_services/service/local_service.dart';
import 'package:paribu_mobile/feature/bottom_nav_bar/bloc/cubit/bottom_nav_bar_cubit.dart';
import 'package:paribu_mobile/feature/markets/bloc/cubit/market_cubit.dart';
import 'package:paribu_mobile/feature/markets/data/repo/i_market_repo.dart';
import 'package:paribu_mobile/feature/markets/data/repo/market_repo.dart';
import 'package:paribu_mobile/feature/wallet/bloc/cubit/wallet_cubit.dart';
import 'package:paribu_mobile/feature/wallet/data/repo/i_wallet_repo.dart';
import 'package:paribu_mobile/feature/wallet/data/repo/wallet_repo.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {
  // client
  sl.registerLazySingleton<Dio>(() => DioManager.getDio());

  // Api Service
  sl.registerLazySingleton(() => ApiService(sl()));

  sl.registerLazySingleton(() => const FlutterSecureStorage(aOptions: AndroidOptions(encryptedSharedPreferences: true)));

  sl.registerLazySingleton<ILocalService>(() => LocalService(sl()));

  //*BottomNavBar
  sl.registerFactory<BottomNavBarCubit>(() => BottomNavBarCubit());

  //*Wallet
  sl.registerLazySingleton<IWalletRepo>(() => WalletRepo());
  sl.registerLazySingleton<WalletCubit>(() => WalletCubit());

  //*Markets
  sl.registerLazySingleton<IMarketRepo>(() => MarketRepo());
  sl.registerFactory<MarketCubit>(() => MarketCubit()..initialize());
}
