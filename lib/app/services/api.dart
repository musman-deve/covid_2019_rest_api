import 'package:covid_2019_rest_api/app/services/api_keys.dart';

class API {
  API({required this.apiKey});
  final String apiKey;

  factory API.sandbox() => API(apiKey: APIKeys.ncovSandboxKey);
  static String host = "https://ncov2019-admin.firebaseapp.com";
  String tokenUri = '$host/token';

  // Uri tockenUri() => Uri(scheme: 'https', host: host, path: 'token');
}
