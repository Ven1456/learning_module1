import 'package:flutter/material.dart';
import 'package:login_bloc/auth/auth_repository.dart';
import 'package:login_bloc/login/login_screens/login_bloc.dart';


class LoginView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:_LoginForm(),
    );
  }


  Widget _LoginForm() {
    return Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _usernameField(),
              _passwordtextField(),
              SizedBox(
                height: 20,
              ),
              _LoginButton(),
            ],
          ),
        ));
  }
}


// Username
  Widget _usernameField() {
    return TextFormField(
      decoration: InputDecoration(
        icon: Icon(Icons.person),
        hintText: "Username",
      ),
      validator: (value) => null,
    );
  }

  Widget _passwordtextField() {
    return TextFormField(
      obscureText: true,
      obscuringCharacter: "*",
      decoration: InputDecoration(
        icon: Icon(Icons.security),
        hintText: "Password",
      ),
      validator: (value) => null,
    );
  }

  Widget _LoginButton() {
    return ElevatedButton(onPressed: () {}, child: Text("Login"));
  }

