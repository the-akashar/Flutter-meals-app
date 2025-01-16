import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget{ 

  const CategoriesScreen({super.key});



  void _selectCategory(BuildContext context , Category category){
    

    final filteredMeals = dummyMeals.where((meal)=>meal.categories.contains(category.id)).toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealsScreen(
          title: category.title, 
          meals: filteredMeals
          ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick your category...'),
      ),
      body: GridView(
        padding:const EdgeInsets.all(24),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3/2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20
        ),
         children:  [
          for(final category in availableCategories)
          CategoryGridItem(category: category , onSelectCategory: (){
            _selectCategory(context , category);
          })
        ],
        ),
      
    );
  }
  
}