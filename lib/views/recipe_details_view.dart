import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/recipe_cubit.dart';


class RecipeDetailsView extends StatefulWidget {
  const RecipeDetailsView({super.key,  this.recipeId, });
  final String? recipeId;
  // final String? recipeName;

  @override
  State<RecipeDetailsView> createState() => _RecipeDetailsViewState();
}

class _RecipeDetailsViewState extends State<RecipeDetailsView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<RecipeCubit>(context)
        .getRecipeById(recipeId: widget.recipeId.toString());

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Recipe Details",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<RecipeCubit, RecipeState>(
          builder: (context, state) {
            if (state is RecipeLoading) {
              return const CustomLoadingWidget();
            } else if (state is RecipeSuccess) {
              return const RecipeDetailsLoadedSuccess();
            } else {
              return const CheckConnection();
            }
          },
        ),
      ),
    );
  }
}
