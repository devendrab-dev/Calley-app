part of 'list_bloc.dart';

@immutable
sealed class ListEvent {}

class Lists extends ListEvent {
  final String id;
  Lists({required this.id});
}

