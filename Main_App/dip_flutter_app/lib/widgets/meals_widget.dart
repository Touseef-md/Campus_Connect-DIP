import 'package:flutter/material.dart';
import '../modals/meals.dart';
import '../screens/meal_detail_screen.dart';

class Meal extends StatelessWidget {
  const Meal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (ctx, index) {
          return InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                MealDetailScreen.routeName,
                arguments: dummyMeals[index]
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  15,
                ),
              ),
              // color: Colors.amber,
              margin: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 8,
              ),
              child: Column(
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(
                          15,
                        ),
                        child: Image.network(
                          dummyMeals[index].imageUrls[0],
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        right: 4,
                        child: IconButton(
                          onPressed: () {},
                          color: Colors.white,
                          icon: Icon(
                            Icons.favorite_border,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: Container(
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              6,
                            ),
                            color: Colors.green,
                          ),
                          // color: Colors.green,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${dummyMeals[index].rating}.0',
                                  style: Theme.of(context).textTheme.caption,
                                ),
                                Icon(
                                  size: 20,
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                              ]),
                        ),
                      ),
                      Positioned(
                        bottom: 25,
                        left: 5,
                        child: Text(
                          dummyMeals[index].title,
                          // 'ds fsdfsdfsdffsdfd sfsdfsfsfsdfsd dfsdf',
                          // softWrap: true,
                          // overflow: TextOverflow.visible,
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        left: 5,
                        child: Text(
                          'Veg',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 35,
                    margin: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 2,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'THis is teh child ',
                          style: TextStyle(),
                        ),
                        Text(
                          '\$${dummyMeals[index].price} for one',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: dummyMeals.length,
      ),
    );
  }
}
