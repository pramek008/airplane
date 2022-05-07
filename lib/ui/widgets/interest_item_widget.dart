import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';

class InterestItemWidget extends StatelessWidget {
  final String text;
  const InterestItemWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/check_circle.png',
          width: 16,
          height: 16,
        ),
        const SizedBox(
          width: 6,
        ),
        // Expanded(
        //   child: Marquee(
        //     text: text,
        //     style: txRegular.copyWith(fontSize: 14),
        //     scrollAxis: Axis.horizontal,
        //     blankSpace: 50,
        //     velocity: 25,
        //     pauseAfterRound: Duration(seconds: 3),
        //     accelerationDuration: Duration(seconds: 1),
        //     accelerationCurve: Curves.linear,
        //     decelerationDuration: Duration(milliseconds: 1000),
        //     decelerationCurve: Curves.easeOut,
        //   ),
        // ),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              text,
              style: txRegular.copyWith(fontSize: 14),
              overflow: TextOverflow.fade,
              softWrap: false,
            ),
          ),
        ),
      ],
    );
  }
}
