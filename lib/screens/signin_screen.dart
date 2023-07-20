// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo_mobile/provider/auth_provider.dart';
import 'package:shamo_mobile/theme.dart';
import 'package:shamo_mobile/widget.dart';

class SigninScreen extends StatefulWidget {
  SigninScreen({Key? key}) : super(key: key);

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  bool isLoading = false;

  hanldeSignIn() async {
    setState(() {
      isLoading = true;
    });
    final login = await Provider.of<AuthProvider>(
      context,
      listen: false,
    ).login(
      email: emailController.text,
      password: passwordController.text,
    );
    if (login) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: alertColor,
          content: Text("Gagal Login"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
              header(
                title: "Login",
                subTitle: "Sign In To Continue",
              ),
              SizedBox(
                height: 70,
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
                'Sign In',
                () => {
                  hanldeSignIn() //Navigator.pushReplacementNamed(context, '/home'),
                },
                isLoading: isLoading,
              ),
              Spacer(),
              footer(
                context,
                'Don\'t hav an account? ',
                'Sign Up',
                '/sign-up',
              )
            ],
          ),
        ),
      ),
    );
  }
}
