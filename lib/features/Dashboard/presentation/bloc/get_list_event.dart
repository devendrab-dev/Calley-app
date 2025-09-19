part of 'get_list_bloc.dart';

@immutable
sealed class GetListEvent {}


class GetList extends GetListEvent {
  final String userId;
  GetList({required this.userId});
}
