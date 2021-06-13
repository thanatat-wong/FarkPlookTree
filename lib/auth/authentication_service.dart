import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;
  final googleSignin = GoogleSignIn(scopes: ['email']);
  final fb = FacebookLogin();
  AuthenticationService(this._firebaseAuth);

  Stream<User> get currentUser => _firebaseAuth.authStateChanges();

  Future<UserCredential> signInWithCredential(AuthCredential credential) =>
      _firebaseAuth.signInWithCredential(credential);

  Future<void> signOut() async {
    await googleSignin.disconnect().catchError((e) {
      print(e);
    });
    await fb.logOut().catchError((e) {
      print(e);
    });
    await _firebaseAuth.signOut();
  }

  Future<String> signIn({String email, String password}) async {
    try {
      print('login called');
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return "Signed in";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String> signInAnonymous() async {
    try {
      print('login called');
      await _firebaseAuth.signInAnonymously();
      return "Signed in";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String> sendRecoveryEmail(String email) async {
    try {
      print('Recovery Email called');
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return "Email Send";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String> signUp(
      {String email,
      String password,
      String firstname,
      String lastname}) async {
    try {
      await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((result) => {
                result.user
                    .updateProfile(displayName: firstname + " " + lastname)
                    .catchError((e) {
                  print(e);
                })
              });
      return "Signed Up";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  signInWithGoogle() async {
    try {
      final GoogleSignInAccount googleUser = await googleSignin.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );

      //Firebase SignIn
      final result = await _firebaseAuth.signInWithCredential(credential);

      print('${result.user.displayName} is now login by Google');
    } catch (e) {
      print(e);
    }
  }

  signInWithFacebook() async {
    print("Starting Facebook Login");
    final res = await fb.logIn(permissions: [
      FacebookPermission.publicProfile,
      FacebookPermission.email
    ]);

    switch (res.status) {
      case FacebookLoginStatus.success:
        print('It worked!');
        //Get Token
        final FacebookAccessToken fbToken = res.accessToken;
        //Convert to Auth Credential
        final AuthCredential credential =
            FacebookAuthProvider.credential(fbToken.token);
        //User Credential to Sign in with Firebase
        final result = await AuthenticationService(_firebaseAuth)
            .signInWithCredential(credential);
        print('${result.user.displayName} is now login by FB');

        break;
      case FacebookLoginStatus.cancel:
        print('The user cancel the login');
        break;
      case FacebookLoginStatus.error:
        print('There was an error');
        break;
    }
  }
}
