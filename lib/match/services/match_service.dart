import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:scorecard/match/models/match_data_response.dart';

const String apiUrl =
    'https://production-rest-microservice.thesportstak.com//api/v2/cricket/getScoreCard/56622';

class MatchService {
  Future<MatchDataResponse> getMatchData() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        log(data.toString());
        return MatchDataResponse.success(data);
      } else {
        return MatchDataResponse.failure();
      }
    } catch (e) {
      return MatchDataResponse.failure();
    }
  }
}
