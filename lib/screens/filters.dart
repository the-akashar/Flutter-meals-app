import 'package:flutter/material.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetirian,
  vegan
}

class FilterScreen extends StatefulWidget{
  const FilterScreen({super.key, required this.currentFilters});

  final Map<Filter, bool> currentFilters;

  @override
  State<FilterScreen> createState() {
    return _FilterScreenState();
  }

}

class _FilterScreenState extends State<FilterScreen> {

  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegeterianFilterSet = false;
  var _veganFilterSet = false;

  @override
  void initState() {
    super.initState();
    _glutenFreeFilterSet = widget.currentFilters[Filter.glutenFree]!;
    _lactoseFreeFilterSet = widget.currentFilters[Filter.lactoseFree]!;
    _vegeterianFilterSet = widget.currentFilters[Filter.vegetirian]!;
    _veganFilterSet = widget.currentFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(
      title: const Text('Your Filters'),
    ),
    body: PopScope(
      canPop: false,
  onPopInvokedWithResult: (bool didPop, dynamic result) {
    if(didPop) return;
      Navigator.of(context).pop({
        Filter.glutenFree: _glutenFreeFilterSet,
        Filter.lactoseFree: _lactoseFreeFilterSet,
        Filter.vegetirian: _vegeterianFilterSet,
        Filter.vegan: _veganFilterSet,
      });
    },
      child: Column(
        children: [
          SwitchListTile(
            value: _glutenFreeFilterSet, 
            onChanged: (isChecked) { 
              setState(() {
                _glutenFreeFilterSet = isChecked;
              });
             },
            title: Text(
              'Gluten-free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                // ignore: deprecated_member_use
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            subtitle:Text(
              'only include gluten free meals....' , 
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                // ignore: deprecated_member_use
                color: Theme.of(context).colorScheme.onBackground,
              ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34 , right : 22),
          ),
          SwitchListTile(
            value: _lactoseFreeFilterSet, 
            onChanged: (isChecked) { 
              setState(() {
                _lactoseFreeFilterSet = isChecked;
              });
             },
            title: Text(
              'Lactose-free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                // ignore: deprecated_member_use
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            subtitle:Text(
              'only include lactose free meals....' , 
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                // ignore: deprecated_member_use
                color: Theme.of(context).colorScheme.onBackground,
              ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34 , right : 22),
          ),
          SwitchListTile(
            value: _vegeterianFilterSet, 
            onChanged: (isChecked) { 
              setState(() {
                _vegeterianFilterSet = isChecked;
              });
             },
            title: Text(
              'Vegiterian',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                // ignore: deprecated_member_use
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            subtitle:Text(
              'only include vegetirian meals....' , 
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                // ignore: deprecated_member_use
                color: Theme.of(context).colorScheme.onBackground,
              ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34 , right : 22),
          ),
          SwitchListTile(
            value: _veganFilterSet, 
            onChanged: (isChecked) { 
              setState(() {
                _veganFilterSet = isChecked;
              });
             },
            title: Text(
              'Vegan',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                // ignore: deprecated_member_use
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            subtitle:Text(
              'only include vegan meals....' , 
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                // ignore: deprecated_member_use
                color: Theme.of(context).colorScheme.onBackground,
              ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34 , right : 22),
          )
        ],
      ),
    ),
   );
  }

}