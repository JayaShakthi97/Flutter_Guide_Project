import 'dart:convert';

import 'package:flutter_guide_project/_api/httpService.dart';
import 'package:flutter_guide_project/_models/Post.dart';

class API {
  static HttpService _httpService = HttpService.getInstance();

  //used API service: https://jsonplaceholder.typicode.com/guide.html
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com';
  static const String _postUrl = _baseUrl + '/posts';

  static Future<List<Post>> getPosts() async {
    try {
      final response = await _httpService.getWithoutToken(url: _postUrl);
      if (response.statusCode == 200) {
        return Post.listFromMap(json.decode(response.body));
      } else {
        throw Exception(response.statusCode);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<Post> getPost(int id) async {
    try {
      final response =
          await _httpService.getWithoutToken(url: _postUrl + '/$id');
      if (response.statusCode == 200) {
        return Post.fromMap(json.decode(response.body));
      } else {
        throw Exception(response.statusCode);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
