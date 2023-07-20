// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo_mobile/provider/auth_provider.dart';
import 'package:shamo_mobile/theme.dart';
import 'package:shamo_mobile/widget.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController usernameController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleSignUp() async {
      setState(() {
        isLoading = true;
      });
      bool register = await authProvider.register(
        name: nameController.text,
        username: usernameController.text,
        email: emailController.text,
        password: passwordController.text,
      );
      if (register) {
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        setState(() {
          isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: alertColor,
            content: Text("Gagal Register"),
          ),
        );
      }
    }

    return Scaffold(
      backgroundColor: bgColor1,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(title: "Sign Up", subTitle: "Register and Happy Shoping"),
              SizedBox(
                height: 70,
              ),
              InputCostumWidget(
                "Full Name",
                'Your Full Name',
                'assets/icon_name.png',
                nameController,
                bottom: 20,
              ),
              InputCostumWidget(
                "Username",
                'Your Username',
                'assets/icon_username.png',
                usernameController,
                bottom: 20,
                obscureText: false,
              ),
              InputCostumWidget(
                "Email",
                'Your email address',
                'assets/icon_email.png',
                emailController,
                bottom: 20,
              ),
              InputCostumWidget(
                "Password",
                'Your password',
                'assets/icon_password.png',
                passwordController,
                bottom: 30,
                obscureText: true,
              ),
              buttonComp(
                'Sign Up',
                () => {handleSignUp()},
                isLoading: isLoading,
              ),
              Spacer(),
              footer(
                context,
                'Already have an account? ',
                'Sign In',
                '/sign-in',
              )
            ],
          ),
        ),
      ),
    );
  }
}
