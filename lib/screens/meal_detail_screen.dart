import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  Widget buildSelectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Text(text, style: Theme.of(context).textTheme.headline6),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(20.0),
      ),
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(10.0),
      height: 150,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(50.0),
            child: AppBar(
              title: Text('${selectedMeal.title}'),
            )
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
            child: Column(
              children: <Widget>[
                Container(
                  height: 300,
                  width: double.infinity,
                  child: Image.network(
                    selectedMeal.imageUrl,
                    fit: BoxFit.contain,
                  ),
                ),
                buildSelectionTitle(context, 'Ingredients'),
                buildContainer(
                  ListView.builder(
                    itemBuilder: (ctx, index) => Card(
                      color: Theme.of(context).accentColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 10.0),
                        child: Text(selectedMeal.ingredients[index]),
                      ),
                    ),
                    itemCount: selectedMeal.ingredients.length,
                  ),
                ),
                buildSelectionTitle(context, 'Steps'),
                buildContainer(
                  ListView.builder(
                    itemBuilder: (ctx, index) => Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text('# ${index + 1}'),
                          ),
                          title: Text(selectedMeal.steps[index]),
                        ),
                        Divider()
                      ],
                    ),
                    itemCount: selectedMeal.steps.length,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
