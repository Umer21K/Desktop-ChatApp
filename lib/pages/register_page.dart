
import 'package:desktop_flutter_app/components/my_button.dart';
import 'package:desktop_flutter_app/components/my_textfield.dart';
import 'package:desktop_flutter_app/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _confirmpwController = TextEditingController();

  //tap to go to register page
  final void Function()? onTap;

  RegisterPage({super.key, required this.onTap });

  //register method
  void register(BuildContext context) {
    // get auth service
    final _auth = AuthService();

    // passwords match -> create user
    if (_pwController.text == _confirmpwController.text) {
      try {
        _auth.signUpWithEmailPassword(
            _emailController.text,
            _pwController.text,
        );
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );

      }
    }
    // password dont match -> show error

    else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Password don't match"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),
            //welcome
            const SizedBox(height: 50),
            Text(
              "let create an account for you",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 25),
            //email textfield
            MyTextField(
              hintText: "Email",
              obscureText: false,
              controller: _emailController,
            ),

            const SizedBox(height: 10),
            //pw textfield
            MyTextField(
              hintText: "Password",
              obscureText: true,
              controller: _pwController,
            ),

            const SizedBox(height: 10),
            //confirm pw textfield
            MyTextField(
              hintText: "Confirm Password",
              obscureText: true,
              controller: _confirmpwController,
            ),

            const SizedBox(height: 25),

            // login button
            MyButton(
              text: "Register",
              onTap: () => register(context),
            ),
            const SizedBox(height: 25),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?", style:
                TextStyle(color: Theme.of(context).colorScheme.primary),),
                GestureDetector(
                  onTap: onTap,
                  child: Text("Login Now!", style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary),
                  ),
                ),
              ],
            )


          ],
        ),
      ),
    );
  }
}