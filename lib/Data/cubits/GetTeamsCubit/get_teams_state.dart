part of 'get_teams_cubit.dart';

@immutable
sealed class GetTeamsState {}

final class GetTeamsInitial extends GetTeamsState {}

final class GetTeamsLoading extends GetTeamsState {}

final class GetTeamsSuccess extends GetTeamsState {
  final GetTeamsModel response;
  GetTeamsSuccess({required this.response});
}

final class GetTeamsError extends GetTeamsState {}

final class GetTopLoading extends GetTeamsState {}

final class GetTopSuccess extends GetTeamsState {
  final GetTopModel response;
  GetTopSuccess({required this.response});
}

final class GetTopError extends GetTeamsState {}

final class ShowTextField extends GetTeamsState {}
