import './meal_item.dart';

var dummyMeals = [
  Meal(
    mealId: 'ID1',
    shopId: 'Shop1',
    shopName: 'Aroma Canteen',
    openTime: DateTime.now(),
    closeTime: DateTime.now(),
    duration: Duration(
      minutes: 10,
    ),
    description: 'This is a very good dish',
    imageUrls: [
      'https://images.unsplash.com/photo-1571091718767-18b5b1457add?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8YnVyZ2VyfGVufDB8fDB8fA%3D%3D&w=1000&q=80',
      'https://c4.wallpaperflare.com/wallpaper/197/854/431/fire-burger-5k-steak-wallpaper-preview.jpg',
      // 'https://media.istockphoto.com/id/1309352410/photo/cheeseburger-with-tomato-and-lettuce-on-wooden-board.jpg?s=612x612&w=0&k=20&c=lfsA0dHDMQdam2M1yvva0_RXfjAyp4gyLtx4YUJmXgg=',
    ],
    isNonVeg: false,
    isVeg: true,
    location: 'North Block 5th Floor',
    price: 20,
    rating: '4',
    title: 'Burger',
  ),
  Meal(
    mealId: 'ID2',
    shopId: 'Shop2',
    shopName: 'Aroma Canteen',
    openTime: DateTime.now(),
    closeTime: DateTime.now(),
    duration: Duration(
      minutes: 15,
    ),
    description: 'This is a very good dish2',
    imageUrls: [
      'https://mobimg.b-cdn.net/v3/fetch/60/6097a5e72da684293dd5bc5a5e6bb653.jpeg',
      'https://cdn.pixabay.com/photo/2014/07/08/12/34/pizza-386717__340.jpg',
      'https://free4kwallpapers.com/uploads/originals/2016/05/15/pizzajust-pizzajust-awesome.-wallpaper_.jpg',
    ],
    isNonVeg: false,
    isVeg: true,
    location: 'North Block 5th Floor',
    price: 200,
    rating: '5',
    title: 'Pizza',
  ),
];
