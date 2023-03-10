

import '../database/users.dart';
import '../models/gender.dart';
import '../models/user.dart';
import '../services/io_service.dart';
import 'sign_in_page.dart';
import 'state_widget.dart';

class SignUpPage extends StateWidget {
  @override
  void build() {
    io.console("Sign Up\n");
    io.console("Fullname: ");
    String name = io.text;

    io.console("Phone: ");
    String phone = io.text;

    io.console("Email: ");
    String email = io.text;

    io.console("Age: ");
    int age = io.number;

    io.console("Gender: \n\t1. Male\n\t2. Female\n");
    int code = io.number;
    Gender gender;
    if(code == 1) {
      gender = Gender.male;
    } else {
      gender = Gender.female;
    }

    io.console("Password: ");
    String password = io.text;

    io.console("Confirm password: ");
    String confirmPassword = io.text;
    if(password != confirmPassword) {
      build();
      return;
    }

    try {
      User user = User(name, phone, email, gender, age, password);
      users.add(user);
      currentUser = user;
      print("\n\n\n\n");
      SignInPage();
    } catch(e) {
      print(e);
      print("\n");
      build();
    }
  }
}