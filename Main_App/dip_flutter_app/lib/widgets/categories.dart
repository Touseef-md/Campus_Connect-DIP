import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  Category({super.key});
  final categories = [
    {'Veg': 'https://thumbs.dreamstime.com/b/fruit-vegetables-7134854.jpg'},
    {
      'Non-Veg':
          'https://im.idiva.com/photogallery/2013/Dec/recipes_idivas_irresistible_non_veg_snacks_for_the_party_season.jpg'
    },
    {
      'Gluten-free':
          'https://media.istockphoto.com/id/1373135952/photo/keto-bread-cooking-different-types-of-nut-flour-almond-hazelnut-cashew-and-baking-ingredients.jpg?b=1&s=170667a&w=0&k=20&c=m2Y5GHEhLxP4736Xk5PsrquJFO7m76uvQE-A3XRVSis='
    },
    {
      'Vegan':
          'https://www.farmersfamily.in/wp-content/uploads/2020/11/veganism.jpg'
    },
    {
      'Indian':
          'https://media.istockphoto.com/id/1168659055/photo/various-indian-dishes-featuring-rogan-josh-chicken-tikka-masala-biryani-tandoori-chicken.jpg?b=1&s=170667a&w=0&k=20&c=LBVl0aZi-JGkcyAhLBuQaqSh_xQky1g_mfsK8s_fG30='
    },
    // {'fsd': 'fsd'},
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(
          10,
        ),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.28,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 100,
            childAspectRatio: 1,
            crossAxisSpacing: 20,
            // mainAxisExtent: 100,
          ),
          padding: EdgeInsets.all(3),
          itemBuilder: (ctx, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(
                    (categories[index].values.toList())[0],
                  ),
                ),
                Text(
                  categories[index].keys.toList()[0],
                )
              ],
            );
            ;
          },
          itemCount: categories.length,
        ),
      ),
    );
  }
}
