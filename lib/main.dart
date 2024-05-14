import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softwareproject/constants.dart';
import 'package:softwareproject/services/all_categories_services.dart';
import 'package:softwareproject/services/get_recipe_by_id.dart';
import 'package:softwareproject/services/get_recipe_in_one_category.dart';
import 'package:softwareproject/views/home_view.dart';

import 'cubits/category_cubit/category_cubit.dart';
import 'cubits/recipe_cubit/recipe_cubit.dart';
import 'my_bloc_observer.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    double widthScreen=MediaQuery.of(context).size.width;
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CategoryCubit(AllCategoriesService()),),

        BlocProvider(create: (context) => RecipeCubit(RecipesInOneCategoryService(),RecipeByIdService()),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Software project',
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:AnimatedSplashScreen(
          duration: 1000,
          animationDuration:const Duration(seconds: 1),
          splash: Constants.appLogo,
          splashIconSize: widthScreen/1.5,
          nextScreen: const HomeView(),
          splashTransition: SplashTransition.fadeTransition,
          curve: Curves.decelerate,
          backgroundColor: Colors.black,
        ),
      ),
    );
  }
}

