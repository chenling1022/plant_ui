
import 'package:plant_ui_522/User.dart';
import 'package:plant_ui_522/auth_servcie.dart';

import 'locator.dart';

class UserController {
  User _currentUser;
  AuthenticationServices _auth = locator.get<AuthenticationServices>();
  Future init;
  Future<User> initUser() async {
    _currentUser = await _auth.getCurrentUser();
    return _currentUser;
  }

  UserController() {
    print("i am being initialized");
    init = initUser();
  }
  User get currentuser => _currentUser;

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    _currentUser = await _auth.signIn(email, password);
  }

  Future<void> signUp(
      String email, String password, String name, bool isAdmin) async {
    String usid = await _auth.signUp(email, password, name);
  }

  void updateName(String newName) {
    _currentUser.name = newName;
    _auth.updateName(newName);
  }
}
