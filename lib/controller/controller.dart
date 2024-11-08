import 'package:flutter/material.dart';
import 'package:json_api_test/model/model.dart';
import 'package:json_api_test/services/services.dart';

class GetUserProvider extends ChangeNotifier {
  List<GetUser> users = [];
  GetUserService getUserService = GetUserService();
  bool isLoading = false;

  Future<List> getUser() async {
    isLoading = true;
    notifyListeners();
    try {
      users = await getUserService.getUser();
      print(users);
      notifyListeners();
    } catch (e) {
      throw Exception('Failed to load post:$e');
    }
    isLoading = false;
    notifyListeners();
    return users;
  }
}
