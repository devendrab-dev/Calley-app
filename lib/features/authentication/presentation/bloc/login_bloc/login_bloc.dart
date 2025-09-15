import 'package:calley/features/authentication/data/auth_repository.dart';
import 'package:calley/features/authentication/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository repository;
  LoginBloc(this.repository) : super(LoginInitial()) {
    on<LoginRequested>(_onLoginRequested);
  }

  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());
    final result = await repository.login(event.email, event.password);
    result.fold(
      (failure) => emit(LoginFailed(failure.message)),
      (user) => emit(LoginSuccess(user)),
    );
  }
}
