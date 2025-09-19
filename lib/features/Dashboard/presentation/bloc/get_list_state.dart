part of 'get_list_bloc.dart';

@immutable
sealed class GetListState {}

final class GetListInitial extends GetListState {}

class GetListSuccess extends GetListState {
  final GetListModel model;
  GetListSuccess(this.model);
}

class GetListFailed extends GetListState {
  final String message;
  GetListFailed(this.message);
}

class GetListLoading extends GetListState {}
