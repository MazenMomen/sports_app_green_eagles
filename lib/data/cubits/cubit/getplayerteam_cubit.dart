// import 'package:bloc/bloc.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// import '../../models/api.dart';
//
// class GetplayerteamState extends Cubit<List<Player>> {
//   GetplayerteamState() : super([]);
//
//   Future<void> fetchPlayersData() async {
//     final apiKey = '78d1729b6765416f7346de1b1f4ee4e06b81e3286cd1218a202b18ebe0261326';
//     final playerId = '103051168';
//     final url = Uri.parse('https://apiv2.allsportsapi.com/football/?&met=Players&playerId=$playerId&APIkey=$apiKey');
//
//     final response = await http.get(url);
//
//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       final List<Player> players = List<Player>.from(data['result'].map((playerJson) => Player.fromJson(playerJson)));
//       emit(players);
//     } else {
//       throw Exception('Failed to load player data');
//     }
//   }
// }
//
//
//
//
//
//
//
//
//
//
