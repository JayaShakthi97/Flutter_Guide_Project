import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class HttpService {
  static final int statusCodeSuccess = 200;
  static HttpService _httpService = HttpService._();
  _HttpBaseClient _httpBaseClient;

  HttpService._() : _httpBaseClient = _HttpBaseClient(http.Client());

  static HttpService getInstance() => _httpService;

  Future<http.Response> get(
      {@required String url, @required String token}) async {
    final headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: "Bearer " + token,
    };
    return await _httpBaseClient.get(url, headers: headers);
  }

  Future<http.Response> getWithoutToken({@required String url}) async {
    final headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    return await _httpBaseClient.get(url, headers: headers);
  }

  Future<http.Response> post(
      {@required String url,
      @required String args,
      @required String token}) async {
    final headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: "Bearer " + token,
    };
    return await _httpBaseClient.post(url, body: args, headers: headers);
  }

  Future<http.Response> postWithOutToken({String url, String args}) async {
    final headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    return await _httpBaseClient.post(url, body: args, headers: headers);
  }
}

class _HttpBaseClient extends http.BaseClient {
  http.Client _httpClient;

  _HttpBaseClient(this._httpClient);

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    return _httpClient.send(request);
  }
}
