import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';

class BookingDetailItemWidget extends StatelessWidget {
  final String title;
  final String value;
  final Color valueColor;

  const BookingDetailItemWidget({
    Key? key,
    required this.title,
    required this.value,
    required this.valueColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/check_circle.png',
            width: 16,
            height: 16,
          ),
          const SizedBox(
            width: 6,
          ),
          Text(
            title,
            style: txRegular.copyWith(
              fontSize: 14,
              color: blackColor,
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: txSemiBold.copyWith(
              fontSize: 15,
              color: valueColor,
            ),
          ),
        ],
      ),
    );
  }
}
