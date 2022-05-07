import 'package:airplane/cubit/page_cubit.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/pages/home_page.dart';
import 'package:airplane/ui/pages/setting_page.dart';
import 'package:airplane/ui/pages/transaction_page.dart';
import 'package:airplane/ui/pages/wallet_page.dart';
import 'package:airplane/ui/widgets/navBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildContent(int curretIndex) {
      switch (curretIndex) {
        case 0:
          return HomePage();
        case 1:
          return TransactionPage();
        case 2:
          return WalletPage();
        case 3:
          return SettingPage();
        default:
          return HomePage();
      }
    }

    Widget buildBottomNavigation() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: MediaQuery.of(context).size.width - (2 * 24),
          margin: EdgeInsets.only(bottom: defaultMargin),
          padding: EdgeInsets.only(
            left: defaultMargin,
            right: defaultMargin,
            top: 18,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ButtomNavbarItem(
                hasNotif: false,
                imgUrl: 'assets/logo_globe.png',
                index: 0,
              ),
              ButtomNavbarItem(
                hasNotif: false,
                imgUrl: 'assets/logo_book.png',
                index: 1,
              ),
              ButtomNavbarItem(
                hasNotif: false,
                imgUrl: 'assets/logo_credit_card.png',
                index: 2,
              ),
              ButtomNavbarItem(
                hasNotif: false,
                imgUrl: 'assets/logo_settings.png',
                index: 3,
              ),
            ],
          ),
        ),
      );
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          backgroundColor: backgrounColor,
          body: Stack(
            children: [
              buildContent(currentIndex),
              buildBottomNavigation(),
            ],
          ),
        );
      },
    );
  }
}
