import 'dart:convert';

import 'package:dio/dio.dart';

class SongClient {
 final Dio _dio = Dio();


  getSongs(String singerName) async {
    String url = 'https://itunes.apple.com/search?term=$singerName&limit=25';

    try {
      Response resp = await _dio.get(url);
      Map<String, dynamic> data = jsonDecode(resp.data);
      print("Response is: ${resp.data}");
      return data;
    } catch (error) {
      print("Found Error: $error");
    }
  }
}