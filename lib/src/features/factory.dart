import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/services/user_service.dart';
import 'profile/profile_screen.dart';
import 'profile/profile_viewmodel.dart';
import 'sign_up/sign_up_screen.dart';

class FeatureFactory {
  static Widget create<T>() {
    switch (T) {
      case SignUpScreen:
        return const SignUpScreen();
      case ProfileScreen:
        return ChangeNotifierProvider(
          create: (_) => ProfileViewModel(UserService()),
          builder: (_, __) => const ProfileScreen(),
        );
    }

    return const Scaffold();
  }
}
