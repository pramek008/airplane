import 'package:airplane/cubit/page_cubit.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/widgets/custom_btn_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgrounColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo_scheduling.png',
                width: MediaQuery.of(context).size.width - (2 * 50),
              ),
              const SizedBox(
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Well Booked',
                    style: txSemiBold.copyWith(
                      color: blackColor,
                      fontSize: 32,
                    ),
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  Image.asset(
                    'assets/logo_confeti.png',
                    width: 40,
                    height: 40,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 40,
                ),
                child: Text(
                  'Are you ready to explore the new world of experiences?',
                  style: txLight.copyWith(
                    color: greyColor,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              CustomButton(
                btnName: 'My Booking',
                width: 2 * 80,
                onPressed: () {
                  context.read<PageCubit>().setPage(1);
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/main', (route) => false);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
