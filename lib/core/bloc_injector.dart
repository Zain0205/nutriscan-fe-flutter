import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutriscan_fe_flutter/blocs/auth/auth_bloc.dart';
import 'package:nutriscan_fe_flutter/core/dio_client.dart';
import 'package:nutriscan_fe_flutter/core/secure_storage_service.dart';
import 'package:nutriscan_fe_flutter/services/auth_service.dart';

class BlocInjector {
  final _secureStorageService = SecureStorageService();
  late final DioClient _dioClient = DioClient(
    secureStorageService: _secureStorageService,
  );

  late final _authService = AuthService(
    dioClient: _dioClient,
    secureStorageService: _secureStorageService,
  );
  // service here

  late final authBloc = AuthBloc(authService: _authService);
  // bloc here

  // singleton pattern
  static final BlocInjector _instance = BlocInjector._internal();
  factory BlocInjector() => _instance;
  BlocInjector._internal();

  List<BlocProvider> get providers => [
        BlocProvider<AuthBloc>(create: (_) => authBloc),
      ];

  void dispose() {
    authBloc.close();
  }
}
