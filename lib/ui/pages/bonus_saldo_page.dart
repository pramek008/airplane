import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/widgets/custom_btn_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BonusPage extends StatelessWidget {
  const BonusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget walletCard() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
              height: 210,
              width: MediaQuery.of(context).size.width - (2 * 38),
              padding: EdgeInsets.all(defaultMargin),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(34),
                gradient: LinearGradient(
                  colors: [
                    const Color(0xff998EFD),
                    walletColor,
                    const Color(0xff998EFD),
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  stops: const [-0.4, 1, -1],
                ),
                boxShadow: [
                  BoxShadow(
                    color: walletColor.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 18,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name',
                              style: txLight.copyWith(
                                fontSize: 14,
                                color: whiteColor,
                              ),
                            ),
                            Text(
                              state.user.name,
                              style: txMedium.copyWith(
                                color: whiteColor,
                                fontSize: 20,
                              ),
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/logo.png',
                            height: 24,
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Text(
                            'Pay',
                            style: txMedium.copyWith(
                              color: whiteColor,
                              fontSize: 16,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Balance',
                        style: txLight.copyWith(
                          color: whiteColor,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        'IDR 280.000.000',
                        style: txMedium.copyWith(
                          color: whiteColor,
                          fontSize: 26,
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
          } else {
            return SizedBox();
          }
        },
      );
    }

    Widget title() => Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Big Bonus',
                    style: txSemiBold.copyWith(
                      color: blackBonusColor,
                      fontSize: 32,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Image.asset(
                    'assets/logo_confeti.png',
                    width: 41,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'We give you early credit so that you can buy a flight ticket',
                style: txLight.copyWith(
                  color: greyColor,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );

    Widget btnStart() => CustomButton(
          btnName: 'Start Fly Now',
          width: 2 * 75,
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, '/main', (route) => false);
          },
        );

    // Widget btnStart() => TextButton(
    //       onPressed: () {},
    //       child: Container(
    //         width: MediaQuery.of(context).size.width - 2 * 77,
    //         padding: const EdgeInsets.symmetric(vertical: 5),
    //         decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(17),
    //           color: purpleColor,
    //         ),
    //         child: TextButton(
    //           onPressed: () {
    //             Navigator.pushReplacementNamed(context, '/home');
    //           },
    //           child: Text(
    //             'Start Fly Now',
    //             style: txMedium.copyWith(
    //               fontSize: 18,
    //               color: whiteColor,
    //             ),
    //           ),
    //         ),
    //       ),
    //     );

    return Scaffold(
      backgroundColor: backgrounColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              walletCard(),
              const SizedBox(
                height: 80,
              ),
              title(),
              const SizedBox(
                height: 50,
              ),
              btnStart(),
            ],
          ),
        ),
      ),
    );
  }
}
