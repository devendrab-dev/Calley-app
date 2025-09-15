part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class SignupRequested extends AuthEvent {
  final String username;
  final String email;
  final String password;
  SignupRequested(this.username, this.email, this.password);
}

class OtpRequest extends AuthEvent {
  final String email;

  OtpRequest(this.email);
}

class VerifyOtp extends AuthEvent {
  final String email;
  final String otp;

  VerifyOtp(this.email, this.otp);
}
