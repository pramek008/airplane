import 'package:airplane/models/destination_model.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/pages/details_page.dart';

import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final DestinationModel destination;
  const CardWidget(this.destination, {Key? key}) : super(key: key);

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
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
          top: 10,
        ),
        margin: EdgeInsets.only(left: defaultMargin),
        height: 323,
        width: 200,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(1, 4),
              blurRadius: 5,
              spreadRadius: 2,
            )
          ],
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    destination.imgUrl,
                    fit: BoxFit.cover,
                    height: 220,
                    width: 180,
                  ),
                  // child: OctoImage(
                  //   image: CachedNetworkImageProvider(destination.imgUrl),
                  //   placeholderBuilder: OctoPlaceholder.blurHash(
                  //       'LEHV6nWB2yk8pyo0adR*.7kCMdnj'),
                  //   errorBuilder: OctoError.icon(color: redColor),
                  //   fit: BoxFit.cover,
                  // ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        destination.name,
                        maxLines: 1,
                        overflow: TextOverflow.fade,
                        softWrap: false,
                        style: txMedium.copyWith(
                          fontSize: 18,
                          color: blackColor,
                        ),
                      ),
                      Text(
                        destination.city,
                        style: txLight.copyWith(
                          color: greyColor,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 55,
                height: 30,
                padding: const EdgeInsets.only(
                  left: 5,
                  bottom: 5,
                ),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/logo_star.png',
                      width: 20,
                      height: 20,
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    Text(
                      destination.rating.toString(),
                      style: txMedium.copyWith(
                        fontSize: 14,
                        color: blackColor,
                        letterSpacing: 1,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
