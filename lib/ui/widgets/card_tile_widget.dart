import 'package:airplane/models/destination_model.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/pages/details_page.dart';
import 'package:flutter/material.dart';

class CardTileWidget extends StatelessWidget {
  final DestinationModel destination;

  const CardTileWidget(this.destination, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsPage(destination),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(
          top: 10,
          left: 10,
          bottom: 10,
          right: 16,
        ),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(3, 4),
              blurRadius: 5,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                destination.imgUrl,
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
                children: [
                  Text(
                    destination.name,
                    overflow: TextOverflow.fade,
                    maxLines: 1,
                    softWrap: false,
                    style: txMedium.copyWith(
                      fontSize: 18,
                      color: blackColor,
                    ),
                  ),
                  Text(
                    destination.city,
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
                  destination.rating.toString(),
                  style: txMedium.copyWith(fontSize: 14),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
