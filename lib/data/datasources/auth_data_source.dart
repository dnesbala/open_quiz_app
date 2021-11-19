import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthDataSource {
  Future<GoogleSignInAccount?> signInWithGoogle();
  Future logOut();
}

class AuthDataSourceImpl extends AuthDataSource {
  final _googleSignIn = GoogleSignIn();

  @override
  Future<GoogleSignInAccount?> signInWithGoogle() {
    return _googleSignIn.signIn();
  }

  @override
  Future logOut() {
    return _googleSignIn.disconnect();
  }
}
