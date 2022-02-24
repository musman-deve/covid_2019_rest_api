import 'dart:convert';
import 'package:covid_2019_rest_api/app/services/api.dart';
import 'package:covid_2019_rest_api/app/services/api_keys.dart';
import 'package:http/http.dart' as http;

class APIService {
  APIService(this.api);
  final String api;
  // final API api;

  Future<dynamic> getAccessToken() async {
    API api = API(apiKey: APIKeys.ncovSandboxKey);
    final response = await http.post(
      Uri.parse(api.tokenUri),
      headers: {'Authorization': 'Basic ${api.apiKey}'},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final accessToken = data['access_token'];
      if (accessToken != null) {
        return accessToken;
      }
    }
    print(
        'Request ${api.tokenUri} failed\nResponse: ${response.statusCode} ${response.reasonPhrase}');
    throw response;
  }
}
