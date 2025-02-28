import 'package:get_it/get_it.dart';
import 'package:paribu_mobile/feature/bottom_nav_bar/bloc/cubit/bottom_nav_bar_cubit.dart';
import 'package:paribu_mobile/feature/wallet/bloc/cubit/wallet_cubit.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {
  // client
  // sl.registerLazySingleton<Dio>(() => DioManager.getDio());

  // Api Service
  // sl.registerLazySingleton(() => ApiService(sl()));

  //*BottomNavBar
  sl.registerFactory<BottomNavBarCubit>(() => BottomNavBarCubit());

  //*Wallet
  sl.registerLazySingleton<WalletCubit>(() => WalletCubit());

  //*Markets
}
