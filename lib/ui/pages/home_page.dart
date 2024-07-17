import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/cubit/destination_cubit.dart';
import 'package:airplane/models/destination_model.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/widgets/card_tile_widget.dart';
import 'package:airplane/ui/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<DestinationCubit>().fetchDestinations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
              margin: EdgeInsets.only(
                left: defaultMargin,
                right: defaultMargin,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 7,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Howdy,',
                              style: txSemiBold.copyWith(
                                fontSize: 24,
                                color: blackColor,
                              ),
                            ),
                            Text(
                              state.user.name,
                              style: txSemiBold.copyWith(
                                fontSize: 24,
                                color: blackColor,
                              ),
                              overflow: TextOverflow.fade,
                              softWrap: false,
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      const CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/images/avatar.png'),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    'Where to fly today?',
                    style: txLight.copyWith(
                      fontSize: 16,
                      color: greyColor,
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      );
    }

    Widget horizontalContent(List<DestinationModel> destinationts) {
      return SizedBox(
        height: 330,
        child: ListView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(
            bottom: 10,
            right: defaultMargin,
          ),
          children: destinationts.map((DestinationModel destination) {
            return CardWidget(destination);
          }).toList(),
        ),
      );
    }

    Widget verticalContent(List<DestinationModel> destinationts) {
      return Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'New This Year',
              style: txSemiBold.copyWith(
                fontSize: 18,
                color: blackColor,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Column(
              children: destinationts.map((DestinationModel destination) {
                return CardTileWidget(destination);
              }).toList(),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgrounColor,
      //floatingActionButton: navbar(),
      body: SafeArea(
        child: BlocConsumer<DestinationCubit, DestinationState>(
          listener: (context, state) {
            if (state is DestinationFailed) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                  backgroundColor: redColor,
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is DestinationSuccess) {
              return SingleChildScrollView(
                padding: const EdgeInsets.only(top: 30),
                child: Column(
                  children: [
                    header(),
                    const SizedBox(
                      height: 30,
                    ),
                    horizontalContent(state.destinations),
                    const SizedBox(
                      height: 20,
                    ),
                    verticalContent(state.destinations),
                    const SizedBox(
                      height: 140,
                    ),
                  ],
                ),
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
