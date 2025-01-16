import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget{
  const MealsScreen({super.key , required this.title , required this.meals});

  final String title ;

  final List<Meal> meals ;

  @override
  Widget build(BuildContext context) {
    Widget content =  Center(   
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Uh oh nothings here....',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                // ignore: deprecated_member_use
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            const SizedBox(height:16),
            Text(
              'Try selecting a diff category!',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                // ignore: deprecated_member_use
                color: Theme.of(context).colorScheme.onBackground,
              ),
            )
          ],
        )
      );
    
     

    if(meals.isNotEmpty){
      content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (context, index) => MealItem(meal: meals[index]),
    );
    }

  return Scaffold(
    appBar: AppBar(
      title: Text(title)
      ),
      body: content,
  );
  }
  
}