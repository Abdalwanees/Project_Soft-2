import 'package:flutter/material.dart';
import 'package:softwareproject/constants.dart';
import 'package:softwareproject/views/home_view.dart';
import 'package:softwareproject/widgets/custome_welcomeview_button.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              Constants.welcomeImage,
              fit: BoxFit.fill,
              // opacity: const AlwaysStoppedAnimation(.89),
            ),
            Positioned(
              bottom: 225,
              left: widthScreen / 5.5,
              child: Text(
                textAlign: TextAlign.center,
                "Lets\nCooking",
                style: TextStyle(
                    fontSize: widthScreen / 7,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              bottom: 180,
              left: widthScreen / 5,
              child: Text("Find best recipes for cooking",
                  style: TextStyle(
                    fontSize: widthScreen / 25,
                    color: Colors.white,
                    background: Paint()..color = Colors.black.withOpacity(.2),
                  )),
            ),
            Positioned(
              bottom: 70,
              left: widthScreen / 8.5,
              child: CustomButton(
                icon: Icons.arrow_forward,
                title: "Start cooking",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeView(),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

