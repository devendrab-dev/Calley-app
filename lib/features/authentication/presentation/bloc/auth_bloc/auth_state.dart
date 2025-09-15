part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

class AuthInitial extends AuthState {}

class SignUpLoading extends AuthState {}

class SignUpSuccess extends AuthState {
  final String message;
  SignUpSuccess(this.message);
}

class SignUpFailed extends AuthState {
  final String message;
  SignUpFailed(this.message);
}

class OtpRequestL extends AuthState {}

class OtpRequestS extends AuthState {
  final String message;
  OtpRequestS(this.message);
}

class OtpRequestF extends AuthState {
  final String message;
  OtpRequestF(this.message);
}

class OtpVerifyS extends AuthState {
  final String message;
  OtpVerifyS(this.message);
}

class OtpVerifyF extends AuthState {
  final String message;
  OtpVerifyF(this.message);
}
