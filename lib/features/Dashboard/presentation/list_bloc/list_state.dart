part of 'list_bloc.dart';

@immutable
sealed class ListState {}

final class ListInitial extends ListState {}

final class ListLoading extends ListState {}

class ListSucess extends ListState {
  final CallData data;

  ListSucess(this.data);
}

class ListFailed extends ListState {
  final String message;
  ListFailed(this.message);
}