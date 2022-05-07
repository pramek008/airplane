import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String btnName;
  final double width;
  final Function() onPressed;

  const CustomButton({
    Key? key,
    required this.btnName,
    required this.width,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - width,
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17),
        color: purpleColor,
      ),
      child: TextButton(
        onPressed: () {
          onPressed();
        },
        child: Text(
          btnName,
          style: txMedium.copyWith(
            fontSize: 18,
            color: whiteColor,
          ),
        ),
      ),
    );
  }
}
