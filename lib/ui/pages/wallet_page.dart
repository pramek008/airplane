import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          return Center(
            child: Container(
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
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
