class CarouselItem {
  final String _imageUrl;
  const CarouselItem(
    this._imageUrl,
  );
  String get imageUrl {
    return _imageUrl;
  }
}

// class Carousal {
const List items = [
  CarouselItem(
      'https://www.pngitem.com/pimgs/m/333-3335621_dosa-masala-dosa-hd-png-download.png'),
  CarouselItem(
      'https://wallpapercave.com/wp/wp3495545.jpg'),
      CarouselItem('https://w0.peakpx.com/wallpaper/261/676/HD-wallpaper-hot-spicy-burger-foods-entertainment-cool-yummy-fun.jpg')
];
  // List get items {
  //   return _items;
  // }
// }
