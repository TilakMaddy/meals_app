import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  static const routeName = '/sfgsgsa';

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust Meal Selection',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                SwitchListTile(
                  title: Text('Glutten Free'),
                  subtitle: Text('Only include glutten free meals'),
                  value: _glutenFree,
                  onChanged: (val) {
                    setState(() {
                      _glutenFree = val;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('Vegetarian'),
                  subtitle: Text('Only include vegetarian meals'),
                  value: _vegetarian,
                  onChanged: (val) {
                    setState(() {
                      _vegetarian = val;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('Vegan'),
                  subtitle: Text('Only include Vegan meals'),
                  value: _vegan,
                  onChanged: (val) {
                    setState(() {
                      _vegan = val;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('Lactose Free'),
                  subtitle: Text('Only include Lactose free meals'),
                  value: _lactoseFree,
                  onChanged: (val) {
                    setState(() {
                      _lactoseFree = val;
                    });
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
