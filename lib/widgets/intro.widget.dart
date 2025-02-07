import 'dart:math';

import 'package:coffe/config/colors_constants.dart';
import 'package:coffe/config/services_locator.dart';
import 'package:coffe/models/coffee_item.model.dart';
import 'package:coffe/services/navigation.service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroWidget extends StatelessWidget {
  const IntroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        locator<NavigationService>().navigatorKey.currentState!.pushNamed(
              'home',
            );
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0, .3, 0.4],
            colors: [Colors.white, kBrownColor, Colors.white.withOpacity(0.8)],
          ),
        ),
        child: Stack(children: [
          ...[1, 2, 3, 4].map((index) {
            double scale = 1.0 + (index - 1) * 0.32 + (index == 4 ? 0.3 : 0);
            double translate = (index - 1) * 100.0 + (index == 4 ? 160 : 0);

            return Transform(
              alignment: Alignment.topCenter,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..translate(10.0, translate)
                ..scale(scale),
              child: Hero(
                tag: "coffee_${CoffeeItem.mockItems[index].id}",
                child: Image.asset(
                  CoffeeItem.mockItems[index].image,
                  fit: BoxFit.contain,
                ),
              ),
            );
          }),
          Align(
            alignment: Alignment.center + const Alignment(0, 0.25),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                IntrinsicHeight(
                  child: Column(
                    children: [
                      Text(
                        "Steizy",
                        style: GoogleFonts.dancingScript(
                          fontSize: 80,
                          fontWeight: FontWeight.w100,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Coffee",
                        style: GoogleFonts.montserrat(
                          fontSize: 50,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 56,
                  top: 21,
                  child: Transform.rotate(
                    angle: pi / 6,
                    child: Image.asset(
                      'assets/images/bean.png',
                      height: 22,
                    ),
                  ),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
