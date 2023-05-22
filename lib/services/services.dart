import 'dart:convert';

import 'package:yenibisim/model/model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;


class ApiService {
  
  Future<UserModel?> getUser() async {
    var response = await http
        .get(Uri.parse("http://api.citybik.es/v2/networks/baksi-bisim"));

    var data = json.decode(response.body);

    return data == null
        ? null
        : UserModel.fromJson(data as Map<String, dynamic>);
  }


}

final userProvider = Provider<ApiService>((ref) => ApiService());