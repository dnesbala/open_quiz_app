import 'package:google_sign_in/google_sign_in.dart';
import 'package:open_quiz_app/data/datasources/auth_data_source.dart';

abstract class AuthenticationRepository {
  Future<GoogleSignInAccount?> signInWithGoogle();
  Future logOut();
}

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final AuthDataSource authDataSource;

  AuthenticationRepositoryImpl({required this.authDataSource});

  @override
  Future logOut() async {
    await authDataSource.logOut();
  }

  @override
  Future<GoogleSignInAccount?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? user = await authDataSource.signInWithGoogle();
      print(user);
      return user;
    } on Exception catch (e) {
      print(e);
      throw Exception('Something went wrong!');
    }
  }
}
