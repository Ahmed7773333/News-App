import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/json%20models/news_json_model.dart';

import '../json models/json_model.dart';

class ApiManager {
  static Future<SourceResponce> getSource(String category) async {
    Uri url = Uri.https(
      'newsapi.org',
      '/v2/top-headlines/sources',
      {
        "apiKey": "289cbd6908f44503bb7fe60e7caa1879",
        "category": category,
      },
    );
    http.Response response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    SourceResponce data = SourceResponce.fromJson(jsonData);

    return data;
  }

  static Future<NewsResponce> getNews(String id) async {
    Uri url = Uri.https(
      'newsapi.org',
      '/v2/everything',
      {
        "apiKey": "289cbd6908f44503bb7fe60e7caa1879",
        "sources": id,
      },
    );
    http.Response response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    NewsResponce data = NewsResponce.fromJson(jsonData);
    return data;
  }
}
