import 'package:calley/features/Dashboard/data/data_repository.dart';
import 'package:calley/features/Dashboard/data/models/test_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'list_event.dart';
part 'list_state.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  DataRepository repository;
  ListBloc(this.repository) : super(ListInitial()) {
    on<Lists>(_onTestList);
  }

  Future<void> _onTestList(Lists event, Emitter<ListState> emit) async {
    emit(ListLoading());
    final result = await repository.list();
    result.fold(
      (failure) => emit(ListFailed(failure.message)),
      (user) => emit(ListSucess(user)),
    );
  }
}
