import 'package:flutter/material.dart';
import 'package:online_reservations_for_sports/appPages/home/homePage.dart';

class loginForm extends StatelessWidget {
  const loginForm({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding:EdgeInsets.symmetric(vertical:20.0) ,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person_outline_outlined),
                labelText: 'E-Mail',
                hintText: '123@example.com',
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height:20.0),

            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.fingerprint),
                labelText: 'Password',
                hintText: '12345',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed:(){} ,
                  icon: Icon(Icons.remove_red_eye_sharp),
                ),
              ),
            ),

            SizedBox(height:20.0),

            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: (){}, child: Text('Forgot password?'),
              ),
            ),


            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, HomePage.name);
                },
                child: Text(
                    'Login'.toUpperCase()),
              ),
            ),

          ],

        ),
      ),
    );
  }
}