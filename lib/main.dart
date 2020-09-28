import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/meal_detail_screen.dart';
import 'package:flutter_complete_guide/screens/tabs_screen.dart';

import 'screens/category_meals_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primaryColor: Color(0xff3dccc7),
        accentColor: Colors.white,
        canvasColor: Colors.white,
        fontFamily: 'Roboto',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText2: TextStyle(
              color: Colors.black87
            ),
            bodyText1: TextStyle(
              color: Color.fromRGBO(255, 166, 158, 1),
            ),
            headline6: TextStyle(
              fontSize: 22,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
            )),
      ),
      // home: CategoriesScreen(),
      initialRoute: '/', // default is '/'
      routes: {
        '/': (ctx) => TabsScreen(),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
      },
    );
  }
}
