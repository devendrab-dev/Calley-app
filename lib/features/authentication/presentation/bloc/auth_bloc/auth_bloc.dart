import 'package:calley/features/authentication/data/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;
  AuthBloc(this.repository) : super(AuthInitial()) {
    on<SignupRequested>(_onSignupRequested);
    on<OtpRequest>(_onOtpRequest);
    on<VerifyOtp>(_onOtpVerify);
  }

  Future<void> _onSignupRequested(
    SignupRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(SignUpLoading());
    final result = await repository.signup(
      event.username,
      event.email,
      event.password,
    );
    result.fold(
      (failure) => emit(SignUpFailed(failure.message)),
      (user) => emit(SignUpSuccess(user)),
    );
  }

  Future<void> _onOtpRequest(OtpRequest event, Emitter<AuthState> emit) async {
    emit(OtpRequestL());
    final result = await repository.otpRequest(event.email);
    result.fold(
      (failure) => emit(OtpRequestF(failure.message)),
      (user) => emit(OtpRequestS(user)),
    );
  }

  Future<void> _onOtpVerify(VerifyOtp event, Emitter<AuthState> emit) async {
    emit(OtpRequestL());
    final result = await repository.verifyOtp(event.email, event.otp);
    result.fold(
      (failure) => emit(OtpVerifyF(failure.message)),
      (user) => emit(OtpVerifyS(user)),
    );
  }
}
