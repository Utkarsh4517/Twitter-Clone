import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/apis/auth_api.dart';

class AuthController extends StateNotifier<bool> {
  final AuthAPI _authAPI; // instance of Auth API
  AuthController({required AuthAPI authAPI})
      : _authAPI = authAPI,
        super(false);

  void signUp({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    state = true;
    // ignore: unused_local_variable
    final res = await _authAPI.signUp(
      email: email,
      password: password,
    );
    res.fold((l) => null, (r) => print(r.email));
  }
}
