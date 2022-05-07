import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/widgets/custom_btn_widget.dart';
import 'package:flutter/material.dart';

class OnBoardPage extends StatelessWidget {
  const OnBoardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget title() => Text(
          'Fly Like a Bird',
          style: txSemiBold.copyWith(
            color: whiteColor,
            fontSize: 32,
          ),
        );

    Widget subtitle() => Text(
          'Explore new world with us and let yourself get an amazing experiences',
          style: txLight.copyWith(
            color: whiteColor,
            fontSize: 16,
          ),
          textAlign: TextAlign.center,
        );

    Widget btnStart() => CustomButton(
          btnName: 'Get Started',
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/sign-up');
          },
          width: 2 * 75,
        );
    // Container(
    //       width: MediaQuery.of(context).size.width - 2 * 77,
    //       padding: const EdgeInsets.symmetric(vertical: 5),
    //       decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(17),
    //         color: purpleColor,
    //       ),
    //       child: TextButton(
    //         onPressed: () {
    //           Navigator.pushReplacementNamed(context, '/sign-up');
    //         },
    //         child: Text(
    //           'Get Started',
    //           style: txMedium.copyWith(
    //             fontSize: 18,
    //             color: whiteColor,
    //           ),
    //         ),
    //       ),
    //     );

    return Scaffold(
      body: SafeArea(
          child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/images/onboard_image.png',
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
                height: MediaQuery.of(context).size.height * 0.45,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, blackColor],
                ))),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 2 * defaultMargin,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.6,
                ),
                title(),
                const SizedBox(
                  height: 10,
                ),
                subtitle(),
                const SizedBox(
                  height: 50,
                ),
                btnStart(),
                // CustomButton(btnName: '', routeName: '/', width: 2*77,),
              ],
            ),
          )
        ],
      )),
    );
  }
}
