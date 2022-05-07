import 'package:airplane/cubit/seat_cubit.dart';
import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeatItemWidget extends StatelessWidget {
  /*
   * 0 : Available
   * 1 : Selected
   * 2 : Unavailable
  */
  final bool isAvailable;
  final String id;
  const SeatItemWidget({
    Key? key,
    this.isAvailable = true,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSelected = context.watch<SeatCubit>().isSelected(id);

    backgrounColor() {
      if (!isAvailable) {
        return unavailableSeatColor;
      } else if (isSelected) {
        return selectedSeatColor;
      } else {
        return availableSeatColor;
      }
    }

    borderColor() {
      if (!isAvailable) {
        return unavailableSeatColor;
      } else {
        return purpleColor;
      }
    }

    child() {
      if (isSelected) {
        return Center(
          child: Text(
            'YOU',
            style: txSemiBold.copyWith(
              color: whiteColor,
              fontSize: 14,
            ),
          ),
        );
      } else {
        return const SizedBox();
      }
    }

    return GestureDetector(
      onTap: () {
        if (isAvailable) {
          context.read<SeatCubit>().selectSeat(id);
        }
      },
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: backgrounColor(),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: borderColor(),
            width: 2,
          ),
        ),
        child: child(),
      ),
    );
  }
}
