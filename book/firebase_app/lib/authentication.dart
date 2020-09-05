import 'export.dart';

abstract class Authentication {
  Future<void> sendEmailVerifications();
  bool isEmailVerified();
  void registration(String email, String password);
}

class AuthenticationService implements Authentication {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Future<void> sendEmailVerifications() async {
    User user = _firebaseAuth.currentUser;
    user.sendEmailVerification();
  }

  bool isEmailVerified() {
    User user = _firebaseAuth.currentUser;
    return user.emailVerified;
  }

  void registration(String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("user created");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password is too weak');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
