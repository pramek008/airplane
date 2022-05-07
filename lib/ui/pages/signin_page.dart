import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/widgets/custom_btn_widget.dart';
import 'package:airplane/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    Widget title() => Padding(
          padding: const EdgeInsets.only(right: 50),
          child: Text(
            'Sign In with your existing account',
            style: txSemiBold.copyWith(fontSize: 24),
          ),
        );

    Widget formInput() {
      Widget inputEmail() => CustomTextFormField(
            labelText: 'Email Address',
            hintText: 'Your Email',
            controller: emailController,
          );

      Widget inputPassword() => CustomTextFormField(
            labelText: 'Password',
            hintText: 'Your Password',
            obscureText: true,
            controller: passwordController,
          );

      Widget btnSignUp() {
        return BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/main', (route) => false);
            } else if (state is AuthFailed) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                  backgroundColor: redColor,
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return CustomButton(
              btnName: 'Sign In',
              width: 0,
              onPressed: () {
                context.read<AuthCubit>().signIn(
                    email: emailController.text,
                    password: passwordController.text);
              },
            );
          },
        );
      }

      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: whiteColor,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            Wrap(
              runSpacing: 20,
              children: [
                inputEmail(),
                inputPassword(),
              ],
            ),
            const SizedBox(height: 30),
            btnSignUp(),
          ],
        ),
      );
    }

    // ignore: prefer_const_constructors
    return Scaffold(
      backgroundColor: backgrounColor,
      body: SafeArea(
        child: Container(
            padding: EdgeInsets.only(
              left: defaultMargin,
              right: defaultMargin,
              top: 30,
            ),
            child: ListView(
              children: [
                title(),
                const SizedBox(
                  height: 30,
                ),
                formInput(),
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/sign-up');
                    },
                    child: Text(
                      'Don\'t have an account? Sign Up',
                      style: txLight.copyWith(
                          fontSize: 16,
                          color: greyColor,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
