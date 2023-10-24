import 'dart:convert';
import 'package:http/http.dart' as http;

import '../json models/json_model.dart';

class ApiManager {
  static Future<SourceResponce> getSource() async {
    Uri url = Uri.https(
      'newsapi.org',
      '/v2/top-headlines/sources',
      {"apiKey": "289cbd6908f44503bb7fe60e7caa1879"},
    );
    http.Response response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    SourceResponce data = SourceResponce.fromJson(jsonData);
    return data;
  }
}
