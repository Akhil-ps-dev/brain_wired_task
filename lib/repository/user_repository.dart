import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_task/core/urls/urls.dart';
import 'package:http/http.dart' as http;

import '../models/user_model.dart';

class UserRepository {
  Future<UserModel> getUserDetails() async {
    try {
      final response = await http.get(Uri.parse(kBaseUrl));
      if (kDebugMode) {
        print(response.body);
      }

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        // return UserModel.fromJson(body);
        return  UserModel.fromJson(body[0]);
      } else {
        throw Exception(
            'Failed to load user details. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching datas: $e');
    }
  }
}
