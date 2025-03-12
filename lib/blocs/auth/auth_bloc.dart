import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutriscan_fe_flutter/blocs/auth/auth_event.dart';
import 'package:nutriscan_fe_flutter/blocs/auth/auth_state.dart';
import 'package:nutriscan_fe_flutter/services/auth_service.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService authService;

  AuthBloc({required this.authService}) : super(AuthInitial()) {
    on<RegisterStepOne>(_onRegisterStepOne);
    on<RegisterStepTwo>(_onRegisterStepTwo);
    on<UpdateRegisterStepOneField>(_onStepOneUpdate);
    on<UpdateRegisterStepTwoField>(_onStepTwoUpdate);
    on<GoBackStepOneEvent>(_onGoBackStepOne);
    on<RegisterEvent>(_onuserRegisterSubmit);
    on<OtpVerification>(_onOtpUpdate);
    on<OtpVeryficationSubmitEvent>(_onOtpSubmit);
  }

  void _onRegisterStepOne(RegisterStepOne event, Emitter<AuthState> emit) {
    emit(
      AuthStepOneState(
        name: event.name,
        email: event.email,
        password: event.password,
      ),
    );
  }

  void _onStepOneUpdate(
      UpdateRegisterStepOneField event, Emitter<AuthState> emit) {
    final currentState = state;
    if (currentState is AuthStepOneState) {
      emit(
        currentState.copyWith(
          name: event.name,
          email: event.email,
          password: event.password,
        ),
      );
    }
  }

  void _onRegisterStepTwo(RegisterStepTwo event, Emitter<AuthState> emit) {
    final currentState = state;
    if (currentState is AuthStepOneState) {
      emit(
        AuthStepTwoState(
          name: currentState.name,
          email: currentState.email,
          password: currentState.password,
          age: event.age,
          weight: event.weight,
          height: event.height,
          goal: event.goal,
        ),
      );
    } else if (currentState is AuthStepTwoState) {
      emit(
        currentState.copyWith(
          age: event.age,
          weight: event.weight,
          height: event.height,
          goal: event.goal,
        ),
      );
    }
  }

  void _onStepTwoUpdate(
      UpdateRegisterStepTwoField event, Emitter<AuthState> emit) {
    final currentState = state;

    if (currentState is AuthStepTwoState) {
      emit(currentState.copyWith(
        age: event.age,
        weight: event.weight,
        height: event.height,
        goal: event.goal,
      ));
    }
  }

  void _onGoBackStepOne(GoBackStepOneEvent event, Emitter<AuthState> emit) {
    final currentState = state;

    if (currentState is AuthStepTwoState) {
      emit(
        AuthStepOneState(
          name: currentState.name,
          email: currentState.email,
          password: currentState.password,
        ),
      );
    }
  }

  Future<void> _onuserRegisterSubmit(
      RegisterEvent event, Emitter<AuthState> emit) async {
    final curentState = state;

    if (curentState is AuthStepTwoState) {
      emit(AuthLoading());
      try {
        await authService.register(
          email: curentState.email!,
          name: curentState.name!,
          password: curentState.password!,
          age: curentState.age!,
          weight: curentState.weight!,
          height: curentState.height!,
          goal: curentState.goal!,
        );

        emit(AuthOtpVerification(email: curentState.email, otp: null));
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    }
  }

  void _onOtpUpdate(OtpVerification event, Emitter<AuthState> emit) {
    final currentState = state;

    if (currentState is AuthOtpVerification) {
      emit(
        currentState.copyWith(
          otp: event.otp,
        ),
      );
    }
  }

  void _onOtpSubmit(
      OtpVeryficationSubmitEvent event, Emitter<AuthState> emit) async {
    final currentState = state;
    log('currentState: $currentState');
    log("${currentState is AuthOtpVerification}");
    try {
      if (currentState is AuthOtpVerification) {
        emit(AuthLoading());
        await authService.veryfyOtp(
          email: currentState.email!,
          otp: currentState.otp!,
        );
        emit(AuthSuccess());
      }
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}
