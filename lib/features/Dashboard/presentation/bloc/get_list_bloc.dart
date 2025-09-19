import 'dart:async';

import 'package:calley/features/Dashboard/data/data_repository.dart';
import 'package:calley/features/Dashboard/data/models/list_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_list_event.dart';
part 'get_list_state.dart';

class GetListBloc extends Bloc<GetListEvent, GetListState> {
  DataRepository repository;
  GetListBloc(this.repository) : super(GetListInitial()) {
    on<GetList>(_onGetList);
  }

  Future<void> _onGetList(GetList event, Emitter<GetListState> emit) async {
    emit(GetListLoading());
    final result = await repository.getlist(event.userId);
    result.fold((failure) => emit(GetListFailed(failure.message)), (list) {
      emit(GetListSuccess(list));
    });
  }
}
