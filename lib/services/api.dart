import 'dart:convert';

import 'package:http/http.dart' as http;

class Api {
  static const KEY = 'TYE0ci61knEuMGDLULdNP54j77kEKEl8';
  static const BASE_URL = 'https://api.giphy.com/v1/gifs';
  static const TYPE_SEARCH = 'search';
  static const TYPE_TRENDING = 'trending';
  static const LIMIT = 20;

  String type;
  String q;
  int offset;

  Api({this.type, this.q, this.offset});

  bool isTypeSearch() => this.type == TYPE_SEARCH;

  bool isTypeTrending() => this.type == TYPE_TRENDING;

  String get url {
    String params = "api_key=$KEY&offset=${offset ?? 0}&limit=$LIMIT";
    String type = isTypeTrending() ? TYPE_TRENDING : TYPE_SEARCH;

    if (isTypeSearch()) {
      params += "&q=$q";
    }

    return "$BASE_URL/$type?$params";
  }

  factory Api.trending({offset}) {
    return Api(type: 'trending', offset: offset ?? 0);
  }

  factory Api.search(term, {offset}) {
    return Api(type: 'search', q: term, offset: offset ?? 0);
  }

  Future<Map<String, dynamic>> getData() async {
    http.Response response = await http.get(url);
    return json.decode(response.body);
  }
}
