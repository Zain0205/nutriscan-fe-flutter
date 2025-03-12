import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {}

class AuthStepOneState extends AuthState {
  final String? name;
  final String? email;
  final String? password;

  AuthStepOneState({this.name, this.email, this.password});

  AuthStepOneState copyWith({
    String? name,
    String? email,
    String? password,
  }) {
    return AuthStepOneState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  List<Object?> get props => [name, email, password];
}

class AuthStepTwoState extends AuthState {
  final String? name;
  final String? email;
  final String? password;
  final int? age;
  final double? weight;
  final double? height;
  final String? goal;

  AuthStepTwoState({
    this.name,
    this.email,
    this.password,
    this.age,
    this.weight,
    this.height,
    this.goal,
  });

  AuthStepTwoState copyWith({
    String? name,
    String? email,
    String? password,
    int? age,
    double? weight,
    double? height,
    String? goal,
  }) {
    return AuthStepTwoState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      age: age ?? this.age,
      weight: weight ?? this.weight,
      height: height ?? this.height,
      goal: goal ?? this.goal,
    );
  }

  @override
  List<Object?> get props => [name, email, password, age, weight, height, goal];
}

class AuthOtpVerification extends AuthState {
  final String? email;
  final String? otp;

  AuthOtpVerification({this.email, this.otp});

  AuthOtpVerification copyWith({
    String? email,
    String? otp,
  }) {
    return AuthOtpVerification(
      email: email ?? this.email,
      otp: otp ?? this.otp,
    );
  }

  @override
  List<Object?> get props => [email, otp];
}

class AuthFailure extends AuthState {
  final String message;

  AuthFailure(this.message);

  @override
  List<Object?> get props => [message];
}
