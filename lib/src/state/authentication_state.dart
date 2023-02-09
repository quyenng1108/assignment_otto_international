import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

// should save the client id in a .env file using envify package
const String googleClientId =
    '1089922088827-0i3vg5kb8e5tc5rkkm8lb8pu1emh03s9.apps.googleusercontent.com';

class AuthenticationState extends ChangeNotifier {
  bool isLoading = false;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    clientId: googleClientId,
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  Future<bool> signInWithGoogle() async {
    try {
      showLoading();
      await _googleSignIn.signOut();
      final loginResult = await _googleSignIn.signIn();
      if (loginResult != null) {
        dismissLoading();
        return true;
      }
      dismissLoading();
      return false;
    } catch (e) {
      debugPrint(e.toString());
      dismissLoading();
      return false;
    }
  }

  showLoading() {
    if (isLoading) return;
    isLoading = true;
    notifyListeners();
  }

  dismissLoading() {
    if (!isLoading) return;
    isLoading = false;
    notifyListeners();
  }
}
