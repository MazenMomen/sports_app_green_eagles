// player_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/api.dart';

class PlayerService {
  final String apiKey;
  final String teamId;

  PlayerService({required this.apiKey, required this.teamId});

  Future<List<Result>?> fetchPlayers() async {
    final apiUrl =
        'https://apiv2.allsportsapi.com/football/?&met=Players&teamId=$teamId&APIkey=$apiKey';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final PlayerData playerData = PlayerData.fromJson(data);

        if (playerData.success == 1) {
          return playerData.result ?? [];
        } else {
          throw Exception('API request was not successful.');
        }
      } else {
        return null ;
      }
    } catch (error) {
      return null ;
    }
  }
}
