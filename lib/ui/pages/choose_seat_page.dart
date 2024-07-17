import 'package:airplane/cubit/seat_cubit.dart';
import 'package:airplane/models/destination_model.dart';
import 'package:airplane/models/transaction_model.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/pages/checkout_page.dart';
import 'package:airplane/ui/widgets/custom_btn_widget.dart';
import 'package:airplane/ui/widgets/seat_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ChooseSeatPage extends StatefulWidget {
  final DestinationModel destinationModel;

  const ChooseSeatPage({
    Key? key,
    required this.destinationModel,
  }) : super(key: key);

  @override
  State<ChooseSeatPage> createState() => _ChooseSeatPageState();
}

class _ChooseSeatPageState extends State<ChooseSeatPage> {
  @override
  Widget build(BuildContext context) {
    Widget heading() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          top: 30,
        ),
        child: Text(
          'Select Your \nFavorite Seat',
          style: txSemiBold.copyWith(
            fontSize: 24,
            color: blackColor,
          ),
          textAlign: TextAlign.left,
        ),
      );
    }

    Widget descStatus() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          top: 30,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/logo_available.png',
                  width: 20,
                  height: 20,
                ),
                const SizedBox(
                  width: 6,
                ),
                Text(
                  'Available',
                  style: txRegular.copyWith(
                    fontSize: 14,
                    color: blackColor,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Image.asset(
                  'assets/logo_selected.png',
                  width: 20,
                  height: 20,
                ),
                const SizedBox(
                  width: 6,
                ),
                Text(
                  'Selected',
                  style: txRegular.copyWith(
                    fontSize: 14,
                    color: blackColor,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Image.asset(
                  'assets/logo_unavailable.png',
                  width: 20,
                  height: 20,
                ),
                const SizedBox(
                  width: 6,
                ),
                Text(
                  'Unavailable',
                  style: txRegular.copyWith(
                    fontSize: 14,
                    color: blackColor,
                  ),
                )
              ],
            ),
          ],
        ),
      );
    }

    Widget mainContent() {
      Widget rowPosisiton() {
        return Padding(
          padding: const EdgeInsets.only(
            bottom: 16,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 48,
                child: Center(
                  child: Text(
                    'A',
                    style: txRegular.copyWith(
                      color: greyColor,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 48,
                child: Center(
                  child: Text(
                    'B',
                    style: txRegular.copyWith(
                      color: greyColor,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 48,
                child: Center(
                  child: Text(
                    '',
                    style: txRegular.copyWith(
                      color: greyColor,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 48,
                child: Center(
                  child: Text(
                    'C',
                    style: txRegular.copyWith(
                      color: greyColor,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 48,
                child: Center(
                  child: Text(
                    'D',
                    style: txRegular.copyWith(
                      color: greyColor,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }

      Widget seatItem() {
        return Column(
          children: [
            //! ROW 1
            Container(
              margin: const EdgeInsets.only(
                bottom: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SeatItemWidget(
                    isAvailable: false,
                    id: 'A1',
                  ),
                  const SeatItemWidget(
                    isAvailable: false,
                    id: 'B1',
                  ),
                  SizedBox(
                    width: 48,
                    height: 48,
                    child: Center(
                      child: Text(
                        '1',
                        style: txRegular.copyWith(
                          color: greyColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SeatItemWidget(
                    id: 'C1',
                  ),
                  const SeatItemWidget(
                    id: 'D1',
                  ),
                ],
              ),
            ),
            //! ROW 2
            Container(
              margin: const EdgeInsets.only(
                bottom: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SeatItemWidget(
                    id: 'A2',
                  ),
                  const SeatItemWidget(
                    id: 'B2',
                  ),
                  SizedBox(
                    width: 48,
                    height: 48,
                    child: Center(
                      child: Text(
                        '2',
                        style: txRegular.copyWith(
                          color: greyColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SeatItemWidget(
                    id: 'C2',
                  ),
                  const SeatItemWidget(
                    id: 'D2',
                  ),
                ],
              ),
            ),
            //! ROW 3
            Container(
              margin: const EdgeInsets.only(
                bottom: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SeatItemWidget(
                    id: 'A3',
                  ),
                  const SeatItemWidget(
                    id: 'B3',
                  ),
                  SizedBox(
                    width: 48,
                    height: 48,
                    child: Center(
                      child: Text(
                        '3',
                        style: txRegular.copyWith(
                          color: greyColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SeatItemWidget(
                    id: 'C3',
                  ),
                  const SeatItemWidget(
                    id: 'D3',
                  ),
                ],
              ),
            ),
            //! ROW 4
            Container(
              margin: const EdgeInsets.only(
                bottom: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SeatItemWidget(
                    id: 'A4',
                  ),
                  const SeatItemWidget(
                    id: 'B4',
                  ),
                  SizedBox(
                    width: 48,
                    height: 48,
                    child: Center(
                      child: Text(
                        '4',
                        style: txRegular.copyWith(
                          color: greyColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SeatItemWidget(
                    id: 'C4',
                  ),
                  const SeatItemWidget(
                    id: 'D4',
                  ),
                ],
              ),
            ),
            //! ROW 5
            Container(
              margin: const EdgeInsets.only(
                bottom: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SeatItemWidget(
                    id: 'A5',
                  ),
                  const SeatItemWidget(
                    id: 'B5',
                  ),
                  SizedBox(
                    width: 48,
                    height: 48,
                    child: Center(
                      child: Text(
                        '5',
                        style: txRegular.copyWith(
                          color: greyColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SeatItemWidget(
                    id: 'C5',
                  ),
                  const SeatItemWidget(
                    id: 'D5',
                  ),
                ],
              ),
            ),
          ],
        );
      }

      Widget selectedItem() {
        return BlocBuilder<SeatCubit, List<String>>(
          builder: (context, state) {
            return Container(
              margin: const EdgeInsets.only(
                top: 14,
                bottom: 16,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Your Seat',
                        style: txLight.copyWith(
                          color: greyColor,
                          fontSize: 16,
                        ),
                      ),
                      const Spacer(),
                      Expanded(
                        child: Text(
                          state.join(', '),
                          style: txMedium.copyWith(
                            color: blackColor,
                            fontSize: 16,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            );
          },
        );
      }

      Widget totalPrice() {
        return BlocBuilder<SeatCubit, List<String>>(
          builder: (context, state) {
            return SizedBox(
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Total',
                        style: txLight.copyWith(
                          color: greyColor,
                          fontSize: 16,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        NumberFormat.currency(
                          locale: 'id',
                          symbol: 'IDR ',
                          decimalDigits: 0,
                        ).format(
                          state.length * widget.destinationModel.price,
                        ),
                        style: txSemiBold.copyWith(
                          color: purpleColor,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            );
          },
        );
      }

      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: defaultMargin,
          vertical: 30,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 22,
          vertical: 30,
        ),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            rowPosisiton(),
            seatItem(),
            selectedItem(),
            totalPrice(),
          ],
        ),
      );
    }

    Widget btnCheckOut() {
      return BlocBuilder<SeatCubit, List<String>>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.only(
              left: defaultMargin,
              right: defaultMargin,
              bottom: 50,
            ),
            child: CustomButton(
              btnName: 'Continue to Checkout',
              width: 2 * defaultMargin,
              onPressed: () {
                int price = state.length * widget.destinationModel.price;

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CheckoutPage(
                      TransactionModel(
                        destination: widget.destinationModel,
                        amountOfTraveller: state.length,
                        selectedSeat: state.join(', '),
                        insurance: true,
                        refundable: false,
                        vat: 0.45,
                        price: price,
                        grandTotal: price + (price * 0.45).toInt(),
                      ),
                    ),
                  ),
                );
              },
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
            heading(),
            descStatus(),
            mainContent(),
            btnCheckOut(),
          ],
        ),
      ),
    );
  }
}
