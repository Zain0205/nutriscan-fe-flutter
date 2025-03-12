import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class RegisterStepOne extends AuthEvent {
  final String? name;
  final String? email;
  final String? password;

  RegisterStepOne({this.name, this.email, this.password});

  @override
  List<Object?> get props => [name, email, password];
}

class RegisterStepTwo extends AuthEvent {
  final int? age;
  final double? weight;
  final double? height;
  final String? goal;

  RegisterStepTwo({this.age, this.weight, this.height, this.goal});

  @override
  List<Object?> get props => [age, weight, height, goal];
}

class UpdateRegisterStepOneField extends AuthEvent {
  final String? name;
  final String? email;
  final String? password;

  UpdateRegisterStepOneField({
    this.name,
    this.email,
    this.password,
  });

  @override
  List<Object?> get props => [name, email, password];
}

class UpdateRegisterStepTwoField extends AuthEvent {
  final int? age;
  final double? weight;
  final double? height;
  final String? goal;

  UpdateRegisterStepTwoField({
    this.age,
    this.weight,
    this.height,
    this.goal,
  });

  @override
  List<Object?> get props => [age, weight, height, goal];
}

class OtpVerification extends AuthEvent {
  final String? email;
  final String? otp;

  OtpVerification({this.email, this.otp});

  @override
  List<Object?> get props => [email, otp];
}

class GoBackStepOneEvent extends AuthEvent {}

class RegisterEvent extends AuthEvent {}

class LoginEvent extends AuthEvent {
  final String? email;
  final String? password;

  LoginEvent({this.email, this.password});

  @override
  List<Object?> get props => [email, password];
}

class LogoutEvent extends AuthEvent {}

class OtpVeryficationSubmitEvent extends AuthEvent {
  final String? email;
  final String? otp;

  OtpVeryficationSubmitEvent({this.email, this.otp});

  @override
  List<Object?> get props => [email, otp];
}