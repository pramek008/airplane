// ignore_for_file: use_key_in_widget_constructors, file_names, prefer_const_constructors_in_immutables

import 'package:airplane/cubit/page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtomNavbarItem extends StatelessWidget {
  final String imgUrl;
  final int index;
  final bool hasNotif;

  ButtomNavbarItem({
    required this.imgUrl,
    required this.hasNotif,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<PageCubit>().setPage(index);
      },
      child: Stack(
        children: [
          SizedBox(
            height: 42,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  imgUrl,
                  width: context.read<PageCubit>().state == index ? 28 : 24,
                  height: context.read<PageCubit>().state == index ? 28 : 24,
                  color: context.read<PageCubit>().state == index
                      ? const Color(0xff5C40CC)
                      : const Color(0xffB3B5C4),
                ),
                const Spacer(),
                Container(
                  height: 3,
                  width: context.read<PageCubit>().state == index ? 30 : 0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: const Color(0xff5C40CC),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 15,
            bottom: 34,
            child: hasNotif
                ? Image.asset(
                    'assets/logo_notif.png',
                    width: 10,
                    height: 10,
                  )
                : Container(),
          )
          // Image.asset(
          //   'assets/icon_home.png',
          //   width: 24,
          //   height: 24,
          // ),
          // Positioned(
          //   top: 2,
          //   left: 16,
          //   bottom: 11,
          //   child: Image.asset(
          //     'assets/icon_update.png',
          //     height: 8,
          //     width: 8,
          //   ),
          // )
        ],
      ),
    );
  }
}
