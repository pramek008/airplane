// ignore_for_file: use_key_in_widget_constructors

import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/cubit/destination_cubit.dart';
import 'package:airplane/cubit/page_cubit.dart';
import 'package:airplane/cubit/seat_cubit.dart';
import 'package:airplane/cubit/transaction_cubit.dart';
import 'package:airplane/ui/pages/bonus_saldo_page.dart';
import 'package:airplane/ui/pages/main_page.dart';
import 'package:airplane/ui/pages/onboarding_page.dart';
import 'package:airplane/ui/pages/signin_page.dart';
import 'package:airplane/ui/pages/signup_page.dart';
import 'package:airplane/ui/pages/splash_page.dart';
import 'package:airplane/ui/pages/success_checkout_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(Airplane());
}

class Airplane extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => DestinationCubit(),
        ),
        BlocProvider(
          create: (context) => SeatCubit(),
        ),
        BlocProvider(
          create: (context) => TransactionCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: true,
        title: 'Airplane',
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(),
        ),
        routes: {
          '/': (context) => const Splashpage(),
          '/on-boarding': (context) => const OnBoardPage(),
          '/sign-up': (context) => SignUpPage(),
          '/sign-in': (context) => SignInPage(),
          '/bonus': (context) => const BonusPage(),
          '/success': (context) => const SuccessPage(),
          '/main': (context) => const MainPage(),
        },
      ),
    );
  }
}
