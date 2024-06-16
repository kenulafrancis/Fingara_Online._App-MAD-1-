import 'package:flutter/material.dart';

class loginHeaderWidget extends StatelessWidget {
  const loginHeaderWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: AssetImage('assets/images/logo2.jpg'),
          height:size.height*0.2,
        ),
        Text('Welcome Back' , style: Theme.of(context).textTheme.headlineLarge,),
        Text('Reserving facilities is now faster, timely and better', style: Theme.of(context).textTheme.bodyLarge,),

      ],
    );
  }
}

