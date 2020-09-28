import 'package:flutter/material.dart';
import '../screens/meal_detail_screen.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem(
      {@required this.id,
      @required this.title,
      @required this.imageUrl,
      @required this.duration,
      @required this.complexity,
      @required this.affordability});

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      default:
        return 'Unknown';
    }
  }

  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(
      MealDetailScreen.routeName,
      arguments: id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        elevation: 0,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
//                Positioned(
//                  bottom: 20.0,
//                  right: 10.0,
//                  child: Container(
//                    width: 300.0,
//                    color: Colors.black45,
//                    padding:
//                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
//                    child: Text(
//                      title,
//                      style: TextStyle(fontSize: 24, color: Colors.white),
//                      softWrap: true,
//                      overflow: TextOverflow.fade,
//                    ),
//                  ),
//                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.schedule,
                      ),
                      SizedBox(
                        width: 6.0,
                      ),
                      Text(
                        '$duration min',
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.whatshot_outlined,
                      ),
                      SizedBox(
                        width: 6.0,
                      ),
                      Text(
                        complexityText,
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.attach_money_outlined,
                      ),
                      SizedBox(
                        width: 6.0,
                      ),
                      Text(
                        affordabilityText,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
