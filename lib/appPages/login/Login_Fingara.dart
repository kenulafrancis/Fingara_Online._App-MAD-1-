import 'package:flutter/material.dart';
import 'package:flutter/material.dart%20';
import 'package:online_reservations_for_sports/appPages/login/login_form_widget.dart';

import 'login_footer_widget.dart';
import 'login_header_widget.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  static final String name = 'login';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final size= MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body:SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                loginHeaderWidget(size: size),
                const LoginForm(),
                const LoginFooterWidget()
              ],
            ),
          ),
        ) ,
      ),
    );
  }
}




