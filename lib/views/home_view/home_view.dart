import 'package:flutter/material.dart';

import '../../constants.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "RECIPE",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  " APP",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: kPrimaryColor),
                ),
              ],
            ),
            centerTitle: true,
            automaticallyImplyLeading: false,
          ),
          body: const Column()
      ),
    );
  }
}
