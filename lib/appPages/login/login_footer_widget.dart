import 'package:flutter/material.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('OR'),
        const SizedBox(height: 20.0,),
        SizedBox(
          width:double.infinity,
          child: OutlinedButton.icon(
            icon: const Image(image: AssetImage('assets/images/google logo.jpg'), width:20.0 ,),
            onPressed: (){},
            label: const Text('Sign In with Google'),),
        ),
        const SizedBox(height: 20.0,),
        TextButton(
          onPressed: (){},
          child: Text.rich(
            TextSpan(
              text: 'Dont have an Account?',
              style: Theme.of(context).textTheme.bodyLarge,
              children: [
                const TextSpan(
                  text: 'Signup',
                  style: TextStyle(color: Colors.blue),
                ),
              ],
            ),
          ),

        ),

      ],

    );
  }
}