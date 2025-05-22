import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInService {
  // Sesuaikan clientId hanya jika untuk Web
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
    // Kalau untuk web, isi clientId berikut
    // clientId: '978224562526-attd6ttf358dsufbg3ic7mgap81cl1fg.apps.googleusercontent.com',
  );

  Future<GoogleSignInAccount?> signIn() async {
    try {
      return await _googleSignIn.signIn();
    } catch (e) {
      print('Google Sign-In error: $e');
      return null;
    }
  }

  Future<void> signOut() => _googleSignIn.disconnect();

  GoogleSignInAccount? get currentUser => _googleSignIn.currentUser;
}
