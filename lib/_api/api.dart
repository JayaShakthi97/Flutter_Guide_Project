import 'dart:convert';

import 'package:flutter_guide_project/_api/httpService.dart';
import 'package:flutter_guide_project/_models/Area.dart';
import 'package:flutter_guide_project/_models/Post.dart';

class API {
  static HttpService _httpService = HttpService.getInstance();

  //used API service: https://jsonplaceholder.typicode.com/guide.html
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com';
  static const String _postUrl = _baseUrl + '/posts';
  static const String _url =
      'http://localhost:5000/book-my-doctor-eadd7/us-central1/GetDoctorsAreaList';

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

  static Future<Post> savePost(Map<String, dynamic> data) async {
    try {
      final response = await _httpService.postWithOutToken(
          url: _postUrl, args: json.encode(data));
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Post.fromMap(json.decode(response.body));
      } else {
        throw Exception(response.statusCode);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<Map<String, dynamic>> getSelectionDataDumy() async {
    await Future.delayed(Duration(seconds: 4));
    print('returned');
    return {
      'areas': [
        Area(id: 1, aName: 'gampaha'),
        Area(id: 2, aName: 'colombo'),
        Area(id: 3, aName: 'kandy')
      ],
      'suburbs': [
        Sub(id: 1, aName: 'gampaha', sName: 'udugampola'),
        Sub(id: 2, aName: 'gampaha', sName: 'kiridiwela'),
        Sub(id: 3, aName: 'gampaha', sName: 'ganemulla'),
        Sub(id: 4, aName: 'colombo', sName: 'dehiwala'),
        Sub(id: 5, aName: 'colombo', sName: 'rathmalana'),
        Sub(id: 6, aName: 'colombo', sName: 'maharagama'),
      ],
      'doctors': [
        Doctor(id: 1, name: 'Doc 1', area: 'gampaha', sub: 'udugampola'),
        Doctor(id: 2, name: 'Doc 2', area: 'gampaha', sub: 'udugampola'),
        Doctor(id: 3, name: 'Doc 3', area: 'gampaha', sub: 'kiridiwela'),
        Doctor(id: 4, name: 'Doc 4', area: 'gampaha', sub: 'ganemulla'),
        Doctor(id: 5, name: 'Doc 5', area: 'colombo', sub: 'rathmalana'),
        Doctor(id: 6, name: 'Doc 6', area: 'colombo', sub: 'rathmalana'),
      ],
    };
  }

  static Future<Map<String, dynamic>> getSelectionData() async {
    try {
      final response = await _httpService.get(url: _url, token: '');
      print(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        List<Area> areas = [];
        List<Sub> suburbs = [];
        List<Doctor> doctors = [];
        Map<String, dynamic> data = json.decode(response.body);
        List<Map<String, dynamic>>.from(data['areas'] ?? []).forEach((element) {
          areas.add(Area.fromMap(element));
        });
        List<Map<String, dynamic>>.from(data['suburbs'] ?? [])
            .forEach((element) {
          suburbs.add(Sub.fromMap(element));
        });
        List<Map<String, dynamic>>.from(data['doctors'] ?? [])
            .forEach((element) {
          doctors.add(Doctor.fromMap(element));
        });
        return {'areas': areas, 'suburbs': suburbs, 'doctors': doctors};
      } else {
        throw Exception(response.statusCode);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
