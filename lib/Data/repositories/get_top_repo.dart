import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sports_app_green_eagles/data/models/get_top_model.dart';

class GetTopRepo {
  Future<GetTopModel?> getTop() async {
    try {
      var response = await http.get(Uri.parse(
          "https://apiv2.allsportsapi.com/football/?&met=Topscorers&leagueId=207&APIkey=425993696093602702f69a72803df945798494ea12369a5078abbbe050f8e34b&leagueId=207"));
      var decodedResponse = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        GetTopModel myResponse = GetTopModel.fromJson(decodedResponse);
        return myResponse;
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }
}
