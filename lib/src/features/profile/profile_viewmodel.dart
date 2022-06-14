import 'package:flutter/material.dart';

import '../../components/services/user_service.dart';

class ProfileViewModel extends ChangeNotifier {
  final UserService _userService;

  ProfileViewModel(this._userService);
  
  var userName = '';

  Future<void> loadDataUser(String url) async {
    userName = await _userService.getDataUser(url);

    notifyListeners();
  }
}
