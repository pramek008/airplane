import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/cubit/transaction_cubit.dart';
import 'package:airplane/models/transaction_model.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/pages/success_checkout_page.dart';
import 'package:airplane/ui/widgets/booking_details_widget.dart';
import 'package:airplane/ui/widgets/card_tile_widget.dart';
import 'package:airplane/ui/widgets/custom_btn_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CheckoutPage extends StatelessWidget {
  final TransactionModel transaction;
  const CheckoutPage(
    this.transaction, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget routeIllustration() {
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: defaultMargin,
          vertical: 30,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Image.asset(
                'assets/route_illustration.png',
                width: MediaQuery.of(context).size.width - 2 * defaultMargin,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'CGK',
                      style: txSemiBold.copyWith(
                        fontSize: 24,
                        color: blackColor,
                      ),
                    ),
                    Text(
                      'Tangerang',
                      style: txLight.copyWith(
                        color: greyColor,
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'TLC',
                      style: txSemiBold.copyWith(
                        fontSize: 24,
                        color: blackColor,
                      ),
                    ),
                    Text(
                      transaction.destination.city,
                      style: txLight.copyWith(
                        color: greyColor,
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      );
    }

    Widget paymentItemDetails() {
      Widget destination() {
        return Container(
          margin: const EdgeInsets.only(
            bottom: 20,
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.network(
                  transaction.destination.imgUrl,
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                flex: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      transaction.destination.name,
                      overflow: TextOverflow.fade,
                      maxLines: 1,
                      softWrap: false,
                      style: txMedium.copyWith(
                        fontSize: 18,
                        color: blackColor,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      transaction.destination.city,
                      style: txLight.copyWith(
                        fontSize: 14,
                        color: greyColor,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logo_star.png',
                    width: 20,
                    height: 20,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    transaction.destination.rating.toString(),
                    style: txMedium.copyWith(fontSize: 14),
                  )
                ],
              )
            ],
          ),
        );
      }

      Widget bookingDetails() {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Booking Details',
              style: txSemiBold.copyWith(
                fontSize: 16,
                color: blackColor,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            BookingDetailItemWidget(
              title: 'Travelers',
              value: '${transaction.amountOfTraveller.toString()} Person',
              valueColor: blackColor,
            ),
            BookingDetailItemWidget(
              title: 'Seat',
              value: transaction.selectedSeat,
              valueColor: blackColor,
            ),
            BookingDetailItemWidget(
              title: 'Insurance',
              value: transaction.insurance ? 'YES' : 'NO',
              valueColor: transaction.insurance ? greenColor : redColor,
            ),
            BookingDetailItemWidget(
              title: 'Refundable',
              value: transaction.refundable ? 'YES' : 'NO',
              valueColor: transaction.refundable ? greenColor : redColor,
            ),
            BookingDetailItemWidget(
              title: 'VAT',
              value: NumberFormat.percentPattern().format(transaction.vat),
              valueColor: blackColor,
            ),
            BookingDetailItemWidget(
              title: 'Price',
              value: NumberFormat.currency(
                locale: 'id_ID',
                symbol: 'IDR ',
                decimalDigits: 0,
              ).format(transaction.price),
              valueColor: blackColor,
            ),
            BookingDetailItemWidget(
              title: 'Grand Total',
              value: NumberFormat.currency(
                locale: 'id_ID',
                symbol: 'IDR ',
                decimalDigits: 0,
              ).format(transaction.grandTotal),
              valueColor: purpleColor,
            ),
          ],
        );
      }

      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          bottom: 30,
        ),
        padding: const EdgeInsets.only(
          right: 20,
          left: 20,
          top: 30,
          bottom: 15,
        ),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            destination(),
            bookingDetails(),
          ],
        ),
      );
    }

    Widget walletCard() {
      Widget wallet() {
        return BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            if (state is AuthSuccess) {
              return Row(
                children: [
                  Container(
                    // width: 100,
                    height: 70,
                    padding: EdgeInsets.all(defaultMargin),
                    margin: const EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
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
                          color: walletColor.withOpacity(0.4),
                          spreadRadius: 4,
                          blurRadius: 15,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Row(
                        children: [
                          Image.asset('assets/logo.png'),
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
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        NumberFormat.currency(
                          locale: 'id_ID',
                          name: 'IDR ',
                          decimalDigits: 0,
                        ).format(state.user.balance),
                        style: txMedium.copyWith(
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Current Balance',
                        style: txLight.copyWith(
                          color: greyColor,
                          fontSize: 14,
                        ),
                      )
                    ],
                  ),
                ],
              );
            } else {
              return const SizedBox();
            }
          },
        );
      }

      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          bottom: 30,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Payment Details',
              style: txSemiBold.copyWith(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            wallet(),
          ],
        ),
      );
    }

    Widget bottom() {
      return BlocConsumer<TransactionCubit, TransactionState>(
        listener: (context, state) {
          if (state is TransactionSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/success', (route) => false);
          } else if (state is TransactionFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
                backgroundColor: redColor,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is TransactionLoading) {
            Container(
              margin: EdgeInsets.only(
                left: defaultMargin,
                right: defaultMargin,
                bottom: 30,
              ),
              alignment: Alignment.center,
              child: const CircularProgressIndicator(),
            );
          }
          return Container(
            margin: EdgeInsets.only(
              left: defaultMargin,
              right: defaultMargin,
              bottom: 30,
            ),
            child: Column(
              children: [
                CustomButton(
                  btnName: 'Pay Now',
                  width: 2 * defaultMargin,
                  onPressed: () {
                    context
                        .read<TransactionCubit>()
                        .createTransaction(transaction);
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                InkWell(
                  child: Text(
                    'Terms and Conditions',
                    style: txLight.copyWith(
                      color: greyColor,
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: backgrounColor,
      body: SafeArea(
        child: ListView(
          children: [
            routeIllustration(),
            paymentItemDetails(),
            walletCard(),
            bottom(),
          ],
        ),
      ),
    );
  }
}
