import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        home: const HomeView()
      ),
    );
  }
}

