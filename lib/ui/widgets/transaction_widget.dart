import 'package:airplane/models/transaction_model.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/widgets/booking_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionCardWidget extends StatelessWidget {
  final TransactionModel transaction;

  const TransactionCardWidget(this.transaction, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
