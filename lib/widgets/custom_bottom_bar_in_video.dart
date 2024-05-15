
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/recipe_cubit/recipe_cubit.dart';

class CustomBottomBarInVideo extends StatelessWidget {
  const CustomBottomBarInVideo({super.key, required this.area});
  final String area;
  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;

    return  Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child:
      Container(
        width: widthScreen,
        height: 65,
        decoration: BoxDecoration(
          borderRadius: const BorderRadiusDirectional.only(
              bottomEnd: Radius.circular(32),
              bottomStart: Radius.circular(32)
          ),
          color: Colors.transparent.withOpacity(.8)

        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomIconWithTextWidget(
              color: Colors.red,
              icon: Icons.location_on_outlined,
              text: area,
            ),
            CustomIconWithTextWidget(
              color: Colors.amber,
              icon: Icons.star,
              text: "${BlocProvider.of<RecipeCubit>(context).generateRandomRate()}",
            ),
            CustomIconWithTextWidget(
              color: Colors.grey,
              icon: Icons.timer_sharp,
              text: "${BlocProvider.of<RecipeCubit>(context).generateRandomTimeInMin()} min",
            ),
          ],
        ),
      ),
    );
  }
}


class CustomIconWithTextWidget extends StatelessWidget {
  const CustomIconWithTextWidget(
      {super.key, required this.text, required this.icon, required this.color});
  final String text;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;

    return Row(
      children: [
        Icon(
          icon,
          color: color,
          size: widthScreen / 12,
        ),
        Text(
          text,
          style: TextStyle(
              fontSize: widthScreen / 25,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
      ],
    );
  }
}

