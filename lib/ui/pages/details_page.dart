
import 'package:airplane/models/destination_model.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/pages/choose_seat_page.dart';
import 'package:airplane/ui/widgets/custom_btn_widget.dart';
import 'package:airplane/ui/widgets/interest_item_widget.dart';
import 'package:airplane/ui/widgets/photos_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailsPage extends StatelessWidget {
  final DestinationModel destinationModel;

  const DetailsPage(this.destinationModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget bgImage() => Stack(
          children: [
            Stack(
              children: [
                Image.network(
                  destinationModel.imgUrl,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.5,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, blackColor],
                      ))),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: defaultMargin,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Image.asset(
                    'assets/logo_emblem.png',
                    height: 24,
                    width: 108,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            destinationModel.name,
                            style: txSemiBold.copyWith(
                                color: whiteColor, fontSize: 24),
                          ),
                          Text(
                            destinationModel.city,
                            style: txLight.copyWith(
                              color: whiteColor,
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Image.asset(
                            'assets/logo_star.png',
                            width: 20,
                            height: 20,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            destinationModel.rating.toString(),
                            style: txMedium.copyWith(
                              fontSize: 14,
                              color: whiteColor,
                              letterSpacing: 2,
                            ),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        );

    Widget contentAbout() => Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'About',
                style: txSemiBold.copyWith(
                  color: blackColor,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                // 'sadqwdfqwfqwfqwfqwfqwf \nasdasdasdasd',
                destinationModel.about,
                style: txRegular.copyWith(
                  color: blackColor,
                  fontSize: 14,
                  wordSpacing: 1,
                  height: 2,
                ),
                textAlign: TextAlign.justify,
              )
            ],
          ),
        );

    Widget contentPhotos() => Container(
          margin: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Photos',
                style: txSemiBold.copyWith(
                  color: blackColor,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              SizedBox(
                height: 70,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: destinationModel.photos
                      .map((photo) => PhotosItemWidget(imgUrl: photo))
                      .toList(),
                ),
              ),
            ],
          ),
        );

    Widget contentInterest() => Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Interest',
                style: txSemiBold.copyWith(
                  color: blackColor,
                  fontSize: 16,
                ),
              ),
              // const SizedBox(
              //   height: 10,
              // ),
              GridView(
                primary: false,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 1,
                  childAspectRatio: 4,
                ),
                children: destinationModel.interests
                    .map((e) => InterestItemWidget(text: e))
                    .toList(),
              )
            ],
          ),
        );

    Widget contents() => Container(
          margin: EdgeInsets.only(
            left: defaultMargin,
            right: defaultMargin,
            top: MediaQuery.of(context).size.height * 0.47,
            bottom: 30,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Column(
            children: [
              contentAbout(),
              contentPhotos(),
              contentInterest(),
            ],
          ),
        );

    Widget bookBtn() => Container(
          margin: EdgeInsets.only(
            top: 0,
            left: defaultMargin,
            right: defaultMargin,
            bottom: 30,
          ),
          child: Row(
            children: [
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      NumberFormat.currency(
                        locale: 'id',
                        name: 'IDR ',
                        decimalDigits: 0,
                      ).format(destinationModel.price),
                      style: txMedium.copyWith(
                        color: blackColor,
                        fontSize: 18,
                      ),
                      overflow: TextOverflow.fade,
                      softWrap: false,
                    ),
                    Text(
                      'per orang',
                      style: txLight.copyWith(
                        fontSize: 14,
                        color: greyColor,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              CustomButton(
                btnName: 'Book Now',
                width: 2 * 100,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ChooseSeatPage(destinationModel: destinationModel),
                    ),
                  );
                },
              ),
            ],
          ),
        );

    return Scaffold(
      backgroundColor: backgrounColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              bgImage(),
              Column(
                children: [
                  contents(),
                  bookBtn(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
