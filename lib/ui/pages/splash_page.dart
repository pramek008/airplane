import 'dart:async';

import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/shared/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Splashpage extends StatefulWidget {
  const Splashpage({Key? key}) : super(key: key);

  @override
  State<Splashpage> createState() => _SplashpageState();
}

class _SplashpageState extends State<Splashpage> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 3),
      () {
        User? user = FirebaseAuth.instance.currentUser;

        if (user == null) {
          Navigator.pushNamedAndRemoveUntil(
              context, '/on-boarding', (route) => false);
        } else {
          print(user.email);
          context.read<AuthCubit>().getCurrentUser(user.uid);
          Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false);
        }
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 50),
            Text(
              'AIRPLANE',
              style: txMedium.copyWith(
                  fontSize: 32, color: whiteColor, letterSpacing: 10),
            ),
          ],
        ),
      ),
    );
  }
}
