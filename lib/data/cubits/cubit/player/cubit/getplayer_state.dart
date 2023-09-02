part of 'getplayer_cubit.dart';

@immutable
sealed class GetplayerState {}

final class GetplayerInitial extends GetplayerState {}
final class loding extends GetplayerState {}
final class getplayerscucces extends GetplayerState {
  final PlayerData   Result;
  getplayerscucces(
      {required this.Result});
}

final class getplayererror extends GetplayerState {}


